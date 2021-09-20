require 'rails_helper'

describe "Tea API" do
  it "sends a list of teas" do
    create_list(:tea, 3)

    get '/api/v1/teas'

    binding.pry
    expect(response).to be_successful
  end
end
