class BukuController < ApplicationController
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
    @buku = Buku.find(params[:id])
    puts @buku.destroy
  end

  private
    def buku_params
      params.require(:buku).permit(:id_category, :barcode, :isbn, :judul, :deskripsi,
        :penulis, :penerbit, :gambar_buku, :file_buku, :bahasa, :edisi, :tahun_terbit,
        :subject, :lokasi, :jumlah_buku, :isAvailable)
    end
end
