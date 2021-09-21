class CustomerSerializer < ActiveModel::Serializer
  type :customer
  attributes :first_name, :last_name, :email, :address, :city, :state, :zip
end
