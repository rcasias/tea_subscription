class Api::V1::SubscriptionsController < ApplicationController

  def index
    render json: Subscription.all
  end

  def show
    render json: Subscription.find(params[:id])
  end

  def create
    render json: Subscription.create(subscription_params)
  end

  def update
    render json: Subscription.update(params[:id], subscription_params)
  end

  def subscription_params
    params.require(:subscription).permit(:customer_id, :tea_id, :frequency, :is_active)
  end

end
