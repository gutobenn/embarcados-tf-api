class Api::V1::ComprasController < ApplicationController
  before_action :set_compra, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:update, :destroy] # TODO ta vendo se ta logado, mas nao se o usuario é o criador da compra.

  # GET /api/v1/compras
  def index
    puts params
    if params[:radius].present?
      @compras = Compra.near([params[:latitude], params[:longitude]], params[:radius], units: :km) 
    else 
      @compras = Compra.all
    end
    @compras_data = []
    @compras.each do |compra|
      new_fields = {"bought_quotas" => compra.quotas.count}
      @compras_data << JSON::parse(compra.to_json).merge(new_fields)
    end
    render json: @compras_data
  end

  # GET /api/v1/compras/1
  def show
    @compra_data = []
    new_fields = {"user_email" => User.find(@compra.user_id).email, "bought_quotas" => @compra.quotas.count, "quotas" => @compra.quotas}
    @compra_data = JSON::parse(@compra.to_json).merge(new_fields)
    render json: @compra_data
  end

  # POST /api/v1/compras
  def create
    @compra = Compra.new(compra_params)
    @compra.user_id = current_user.id
    if @compra.save
      render json: @compra, status: :created
    else
      render json: @compra.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/compra/1
  def update
    if @compra.update(compra_params)
      render json: @compra
    else
      render json: @compra.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/compras/1
  def destroy
    @compra.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_compra
     @compra = Compra.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def compra_params
      params.require(:compra).permit(:name,  :description, :end, :price_per_quota, :min_number_of_quotas, :max_number_of_quotas, :latitude, :longitude, :status, :address, :picture)
    end
end
