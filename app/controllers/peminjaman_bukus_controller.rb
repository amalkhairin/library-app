class PeminjamanBukusController < ApplicationController
  before_action :set_peminjaman_buku, only: %i[ show update destroy ]

  # GET /peminjaman_bukus
  def index
    @peminjaman_bukus = PeminjamanBuku.all

    render json: @peminjaman_bukus
  end

  # GET /peminjaman_bukus/1
  def show
    render json: @peminjaman_buku
  end

  # POST /peminjaman_bukus
  def create
    @peminjaman_buku = PeminjamanBuku.new(peminjaman_buku_params)

    if @peminjaman_buku.save
      render json: @peminjaman_buku, status: :created, location: @peminjaman_buku
    else
      render json: @peminjaman_buku.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /peminjaman_bukus/1
  def update
    if @peminjaman_buku.update(peminjaman_buku_params)
      render json: @peminjaman_buku
    else
      render json: @peminjaman_buku.errors, status: :unprocessable_entity
    end
  end

  # DELETE /peminjaman_bukus/1
  def destroy
    @peminjaman_buku.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peminjaman_buku
      @peminjaman_buku = PeminjamanBuku.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def peminjaman_buku_params
      params.require(:peminjaman_buku).permit(:id_user, :id_buku, :jadwal_pinjam, :jadwal_kembali, :status)
    end
end
