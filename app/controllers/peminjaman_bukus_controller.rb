# frozen_string_literal: true

class PeminjamanBukusController < ApplicationController
  before_action :authenticate_request
  before_action :check_user_and_book_status, only: %i[ create ]

  def create 
    @loan = PeminjamanBuku.new(set_book_params)
    binding.break
    if @loan.save
      binding.break
      update_book(Buku.find(params[:buku_id]))

      data = {
        user: @current_user.as_json(only: %i[ id name email address ]),
        book: @loan.as_json(only: %i[ buku_id jadwal_pinjam jadwal_kembali ])
      }
      render json: {messages: "OK", success: true, data: data  }.to_json
    end
  end

  private

  def set_book_params
    defaults = {jadwal_pinjam: Time.now, jadwal_kembali: 7.days.from_now, user_id: @current_user.id}
    params.permit(:user_id, :jadwal_pinjam, :jadwal_kembali, :buku_id).reverse_merge(defaults)
  end
  
  def check_user_and_book_status
    @book = Buku.find_by(id: params[:buku_id])

    if @current_user.buku_ids.length > 100 || !@book.is_available
      render json: {status:"404", messages: "you can't loan book more than 2 or book not available"}
    end
  end

  def update_book(book)
    total_update_book = book.jumlah_buku - 1
    book.update_column(:jumlah_buku, total_update_book)

    book.update_column(:is_available, false) if total_update_book == 0
  end
end
