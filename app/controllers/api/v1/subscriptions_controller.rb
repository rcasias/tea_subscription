class Api::V1::SubscriptionsController < ApplicationController

  def index
    render json: Subscription.all
  end

  def show
    render json: Subscription.find(params[:id])
  end

end
