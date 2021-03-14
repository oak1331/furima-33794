class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to [:category, :condition, :delivery, :prefecture, :shipping_date]

end
