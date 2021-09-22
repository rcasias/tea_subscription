require 'rails_helper'

describe "Customer API" do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_successful
    customers_data = JSON.parse(response.body, symbolize_names: true)

    customers = customers_data[:data]

    expect(customers.count).to eq(3)
    
    customers.each do |customer|
      expect(customer).to have_key(:id)
      expect(customer[:id]).to be_an(String)

      expect(customer[:attributes]).to have_key(:first_name)
      expect(customer[:attributes][:first_name]).to be_a(String)

      expect(customer[:attributes]).to have_key(:last_name)
      expect(customer[:attributes][:last_name]).to be_a(String)

      expect(customer[:attributes]).to have_key(:email)
      expect(customer[:attributes][:email]).to be_a(String)

      expect(customer[:attributes]).to have_key(:address)
      expect(customer[:attributes][:address]).to be_a(String)

      expect(customer[:attributes]).to have_key(:city)
      expect(customer[:attributes][:city]).to be_a(String)

      expect(customer[:attributes]).to have_key(:state)
      expect(customer[:attributes][:state]).to be_a(String)

      expect(customer[:attributes]).to have_key(:zip)
      expect(customer[:attributes][:zip]).to be_a(String)
    end
  end

  it "can get one customer by its id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    customer_data = JSON.parse(response.body, symbolize_names: true)

    customer = customer_data[:data][:attributes]

    expect(response).to be_successful

    expect(customer_data[:data]).to have_key(:id)
    expect(customer_data[:data][:id]).to be_an(String)

    expect(customer).to have_key(:first_name)
    expect(customer[:first_name]).to be_a(String)

    expect(customer).to have_key(:last_name)
    expect(customer[:last_name]).to be_a(String)

    expect(customer).to have_key(:email)
    expect(customer[:email]).to be_a(String)

    expect(customer).to have_key(:address)
    expect(customer[:address]).to be_a(String)

    expect(customer).to have_key(:city)
    expect(customer[:city]).to be_a(String)

    expect(customer).to have_key(:state)
    expect(customer[:state]).to be_a(String)

    expect(customer).to have_key(:zip)
    expect(customer[:zip]).to be_a(String)
  end
end
