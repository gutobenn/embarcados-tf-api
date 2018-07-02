class Api::V1::QuotasController < ApplicationController
  before_action :set_quota, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:update, :destroy] # TODO ta vendo se ta logado, mas nao se o usuario é o criador da compra.

  # POST /api/v1/quotas
  def create
    @quota = Quota.new(quota_params)
    @quota.user_id = current_user.id
    if @quota.save
      render json: @quota, status: :created
    else
      render json: @quota.errors, status: :unprocessable_entity
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_quota
     @quota = Quota.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def quota_params
      params.require(:quota).permit(:compra_id, :quantity)
    end
end
