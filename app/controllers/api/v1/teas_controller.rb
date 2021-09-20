class Api::V1::TeasController < ApplicationController

  def index
    render json: Tea.all
  end

end
