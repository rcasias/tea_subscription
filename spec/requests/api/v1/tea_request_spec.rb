require 'rails_helper'

describe "Tea API" do
  it "sends a list of teas" do
    create_list(:tea, 3)

    get '/api/v1/teas'

    expect(response).to be_successful
    tea_data = JSON.parse(response.body, symbolize_names: true)
    teas = tea_data[:data]

    expect(teas.count).to eq(3)

    teas.each do |tea|
      expect(tea).to have_key(:id)
      expect(tea[:id]).to be_an(String)

      expect(tea[:attributes]).to have_key(:title)
      expect(tea[:attributes][:title]).to be_a(String)

      expect(tea[:attributes]).to have_key(:description)
      expect(tea[:attributes][:description]).to be_a(String)

      expect(tea[:attributes]).to have_key(:temperature)
      expect(tea[:attributes][:temperature]).to be_a(Integer)

      expect(tea[:attributes]).to have_key(:brew_time)
      expect(tea[:attributes][:brew_time]).to be_a(String)

      expect(tea[:attributes]).to have_key(:price)
      expect(tea[:attributes][:price]).to be_a(Integer)
    end
  end

  it "can get one tea by its id" do
    id = create(:tea).id

    get "/api/v1/teas/#{id}"

    tea_data = JSON.parse(response.body, symbolize_names: true)
    tea = tea_data[:data][:attributes]

    expect(response).to be_successful

    expect(tea_data[:data]).to have_key(:id)
    expect(tea_data[:data][:id]).to eq(id.to_s)

    expect(tea).to have_key(:title)
    expect(tea[:title]).to be_a(String)

    expect(tea).to have_key(:description)
    expect(tea[:description]).to be_a(String)

    expect(tea).to have_key(:temperature)
    expect(tea[:temperature]).to be_a(Integer)

    expect(tea).to have_key(:brew_time)
    expect(tea[:brew_time]).to be_a(String)

    expect(tea).to have_key(:price)
    expect(tea[:price]).to be_a(Integer)
  end
end
