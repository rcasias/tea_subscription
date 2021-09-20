require 'rails_helper'

describe "Tea API" do
  it "sends a list of teas" do
    create_list(:tea, 3)

    get '/api/v1/teas'

    expect(response).to be_successful
    teas = JSON.parse(response.body, symbolize_names: true)

    expect(teas.count).to eq(3)

    teas.each do |tea|
      expect(tea).to have_key(:id)
      expect(tea[:id]).to be_an(Integer)

      expect(tea).to have_key(:title)
      expect(tea[:title]).to be_a(String)

      expect(tea).to have_key(:description)
      expect(tea[:description]).to be_a(String)

      expect(tea).to have_key(:temperature)
      expect(tea[:temperature]).to be_a(Integer)

      expect(tea).to have_key(:brew_time)
      expect(tea[:brew_time]).to be_a(String)
    end
  end

  it "can get one tea by its id" do
    id = create(:tea).id

    get "/api/v1/teas/#{id}"

    tea = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(tea).to have_key(:id)
    expect(tea[:id]).to eq(id)

    expect(tea).to have_key(:title)
    expect(tea[:title]).to be_a(String)

    expect(tea).to have_key(:description)
    expect(tea[:description]).to be_a(String)

    expect(tea).to have_key(:temperature)
    expect(tea[:temperature]).to be_a(Integer)

    expect(tea).to have_key(:brew_time)
    expect(tea[:brew_time]).to be_a(String)
  end
end
