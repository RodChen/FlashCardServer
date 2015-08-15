class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :level
end
