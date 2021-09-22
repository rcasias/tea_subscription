class Api::V1::CustomerSubscriptionsController < ApplicationController

  def index
    @customer = Customer.find(params[:customer_id])
    @subscriptions = @customer.subscriptions
    render json: @subscriptions, status: :ok
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @new_subscription = @customer.subscriptions.create(subscription_params)
    render json: @new_subscription
  end

  def update
    render json: Subscription.update(params[:id], subscription_params)
  end

  def subscription_params
    params.permit(:tea_id, :frequency, :is_active)
  end

end
