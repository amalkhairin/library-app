# frozen_string_literal: true

class BukuController < ApplicationController
  before_action :authenticate_request, except: %i[index show]
  before_action :set_buku, only: %i[show destroy update]
  before_action :require_admin, only: %i[create update destroy]

  def index
    @bukus = Buku.all
    render json: @bukus
  end

  def show
    render json: @buku
  end

  def create
    @buku = Buku.new(buku_params)
    if @buku.save
      render json: @buku, status: :created
    else
      render json: @buku.errors, status: :unprocessable_entity
    end
  end

  def update
    @buku = Buku.find(params[:id])
    if @buku.update(buku_params)
      render json: @buku, status: :ok
    else
      render json: @buku.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @buku.destroy
    render json: { success: 'Book has been deleted by admin' }
  end

  private

  def buku_params
    params.require(:buku).permit(:category_id, :barcode, :isbn, :judul, :deskripsi,
                                 :penulis, :penerbit, :gambar_buku, :file_buku, :bahasa, :edisi, :tahun_terbit,
                                 :subject, :lokasi, :jumlah_buku, :is_available)
  end

  def set_buku
    @buku = Buku.find(params[:id])
  end

  def require_admin
    render json: { error: 'only admin can do this' } if @current_user.role.role != 'admin'
  end
end
