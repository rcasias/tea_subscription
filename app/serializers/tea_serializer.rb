class TeaSerializer < ActiveModel::Serializer
  type :tea
  attributes :title, :description, :temperature, :brew_time, :price
end
