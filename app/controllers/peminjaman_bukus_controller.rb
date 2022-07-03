# frozen_string_literal: true

class PeminjamanBukusController < ApplicationController
  before_action :authenticate_request
  before_action :find_transaction, only: %i[destroy]
  before_action :check_user_and_book_status, only: %i[create]
  before_action :require_admin, only: %i[destroy]

  def index
    binding.break
    user = User.find(params[:user_id])
    book_list = user.peminjaman_bukus

    book_list.each do |book|
      transaction_status(book)
    end

    render json: { status: '200', book_list: book_list.as_json }
  end

  def create
    @loan = PeminjamanBuku.new(set_book_params)

    if @loan.save
      update_book(Buku.find(params[:buku_id]), 'loan')
      data = {
        user: @current_user.as_json(only: %i[id name email address]),
        book: @loan.as_json(only: %i[buku_id jadwal_pinjam jadwal_kembali])
      }
      render json: { messages: 'OK', success: true, data: data }.to_json
    end
  end

  def destroy
    book_id = @loan.buku_id
    @loan.destroy
    update_book(Buku.find_by(id: book_id), 'return')
    render json: { message: 'Deleted Successfully', status: '200' }
  end

  private

  def find_transaction
    @loan = PeminjamanBuku.find(params[:id])
  end

  def set_book_params
    defaults = { jadwal_pinjam: Time.now, jadwal_kembali: 7.days.from_now, user_id: @current_user.id, status: 'dipinjam'}
    params.permit(:user_id, :jadwal_pinjam, :jadwal_kembali, :buku_id).reverse_merge(defaults)
  end

  def check_user_and_book_status
    @book = Buku.find_by(id: params[:buku_id])
    if @current_user.peminjaman_bukus.length >= 2 || !@book.is_available
      render json: { status: '200', messages: "you can't loan book more than 2 or book not available" }
    else
      return true
    end
  end

  def require_admin
    render json: { messages: 'Only admin can do this action', status: '200' } if @current_user.role.role != 'admin'
  end

  def update_book(book, status)
    total_update_book = (status == 'loan' ? book.jumlah_buku - 1 : book.jumlah_buku + 1)
    book.update_column(:jumlah_buku, total_update_book)
    total_update_book.zero? ? book.update_column(:is_available, false) : book.update_column(:is_available, true)
  end

  def transaction_status(book)
    if (Time.now() > book.jadwal_kembali)
      if (book.status != 'dikembalikan' || book.status == nil)
        book.status = 'belum dikembalikan'
        book.save
      end
    end
  end
end
