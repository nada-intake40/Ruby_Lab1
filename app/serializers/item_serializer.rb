class ItemSerializer < ActiveModel::Serializer

  attribute :name, key: :item_name  do
    object.name.upcase
  end

  attribute :description, key: :item_description do
    object.description.upcase
  end
end
