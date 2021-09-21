class SubscriptionSerializer < ActiveModel::Serializer
  type :subscription
  attributes :customer_id, :tea_id, :is_active, :frequency
end
