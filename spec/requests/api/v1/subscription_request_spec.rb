require 'rails_helper'

describe "Subscription API" do
  it "sends a list of subscriptions" do
    @customer1 = create(:customer)
    @customer2 = create(:customer)
    @customer3 = create(:customer)

    @tea1 = create(:tea)
    @tea2 = create(:tea)
    @tea3 = create(:tea)

    subscription1 = Subscription.create(customer_id: @customer1.id, tea_id: @tea1.id, frequency: 30)
    subscription2 = Subscription.create(customer_id: @customer2.id, tea_id: @tea2.id, frequency: 30)
    subscription3 = Subscription.create(customer_id: @customer3.id, tea_id: @tea3.id, frequency: 30)
    subscription4 = Subscription.create(customer_id: @customer3.id, tea_id: @tea1.id, frequency: 30)
    # binding.pry
    get '/api/v1/subscriptions'

    expect(response).to be_successful
    subscriptions = JSON.parse(response.body, symbolize_names: true)

    expect(subscriptions.count).to eq(4)

    subscriptions.each do |subscription|
      expect(subscription).to have_key(:id)
      expect(subscription[:id]).to be_an(Integer)

      expect(subscription).to have_key(:customer_id)
      expect(subscription[:customer_id]).to be_a(Integer)

      expect(subscription).to have_key(:tea_id)
      expect(subscription[:tea_id]).to be_a(Integer)

      expect(subscription).to have_key(:is_active)
      expect(subscription[:is_active]).to eq(true)

      expect(subscription).to have_key(:frequency)
      expect(subscription[:frequency]).to be_a(Integer)
    end
  end

  it "can get one subscription by its id" do
    @customer1 = create(:customer)
    @customer2 = create(:customer)
    @customer3 = create(:customer)

    @tea1 = create(:tea)
    @tea2 = create(:tea)
    @tea3 = create(:tea)

    subscription1 = Subscription.create(customer_id: @customer1.id, tea_id: @tea1.id, frequency: 30)
    subscription2 = Subscription.create(customer_id: @customer2.id, tea_id: @tea2.id, frequency: 30)
    subscription3 = Subscription.create(customer_id: @customer3.id, tea_id: @tea3.id, frequency: 30)
    subscription4 = Subscription.create(customer_id: @customer3.id, tea_id: @tea1.id, frequency: 30)

    get "/api/v1/subscriptions/#{subscription1.id}"

    subscription = JSON.parse(response.body, symbolize_names: true)

    expect(subscription).to have_key(:id)
    expect(subscription[:id]).to be_an(Integer)

    expect(subscription).to have_key(:customer_id)
    expect(subscription[:customer_id]).to be_a(Integer)

    expect(subscription).to have_key(:tea_id)
    expect(subscription[:tea_id]).to be_a(Integer)

    expect(subscription).to have_key(:is_active)
    expect(subscription[:is_active]).to eq(true)

    expect(subscription).to have_key(:frequency)
    expect(subscription[:frequency]).to be_a(Integer)
  end
end
