class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :shipping_date

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_id
    validates :prefecture_id
    validates :shipping_date_id
  end

end
