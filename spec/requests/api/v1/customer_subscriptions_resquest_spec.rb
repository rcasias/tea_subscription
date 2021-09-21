require 'rails_helper'

describe "Cutsomer Subscriptions" do
  it "finds a subscriptions that belong to a customer" do
    customer_1 = create(:customer)
    customer_2 = create(:customer)

    tea_1 = create(:tea)
    tea_2 = create(:tea)
    tea_3 = create(:tea)

    customer_1.subscriptions.create(tea_id: tea_1.id, frequency: 30)
    customer_1.subscriptions.create(tea_id: tea_2.id, frequency: 30)
    customer_1.subscriptions.create(tea_id: tea_3.id, frequency: 30)

    get "/api/v1/customers/#{customer_1.id}/subscriptions"

    data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(data.count).to eq(3)
  end
end
