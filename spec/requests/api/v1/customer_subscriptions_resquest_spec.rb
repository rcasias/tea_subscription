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
    expect(data[:data].count).to eq(3)
  end

  it "can create a new subscription" do
    customer = create(:customer)
    tea = create(:tea)
    subscription_params = ({
                    tea_id: tea.id,
                    frequency: 30,
                  })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/customers/#{customer.id}/subscriptions", headers: headers, params: JSON.generate(subscription_params)
    created_subscription = customer.subscriptions.last

    expect(response).to be_successful
    expect(created_subscription.customer_id).to eq(customer.id)
    expect(created_subscription.tea_id).to eq(tea.id)
    expect(created_subscription.is_active).to eq(true)
    expect(created_subscription.frequency).to eq(30)
  end

  it "can update an existing subscription" do
    customer = create(:customer)
    tea = create(:tea)
    subscription_params = ({
                    tea_id: tea.id,
                    frequency: 30,
                  })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/customers/#{customer.id}/subscriptions", headers: headers, params: JSON.generate(subscription_params)
    created_subscription = customer.subscriptions.last

    id = created_subscription.id
    previous_status = created_subscription.is_active
    new_subscription_params = { is_active: false }

    headers = {"CONTENT_TYPE" => "application/json"}
    patch "/api/v1/customers/#{customer.id}/subscriptions/#{id}", headers: headers, params: JSON.generate(new_subscription_params)
    subscription = Subscription.find_by(id: id)

    expect(response).to be_successful
    expect(subscription.is_active).to_not eq(previous_status)
    expect(subscription.is_active).to eq(false)
  end

  it "sad path - cannot create a new subscription" do
    customer = create(:customer)
    tea = create(:tea)
    subscription_params = ({
                    tea_id: tea.id
                  })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/customers/#{customer.id}/subscriptions", headers: headers, params: JSON.generate(subscription_params)
    created_subscription = customer.subscriptions.last

    expect(response).to_not be_successful
  end

end
