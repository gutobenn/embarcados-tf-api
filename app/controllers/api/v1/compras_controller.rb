class Api::V1::ComprasController < ApplicationController
  before_action :set_compra, only: [:show, :update, :destroy]
  #before_action :require_authorization!, only: [:show, :update, :destroy] # TODO tirei autenticacao

  # GET /api/v1/compras
  def index
   @compras = Compra.all
   render json: @compras
  end

  # GET /api/v1/compras/1
  def show
    render json: @compra
  end

  # POST /api/v1/compras
  def create
    @compra = Compra.new(compra_params.merge(user: current_user)) # TODO arrumar pra funcionar assim.  tem q exigir no model
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

    def require_authorization!
      unless current_user == @compra.user
        render json: {}, status: :forbidden
      end
    end
end
