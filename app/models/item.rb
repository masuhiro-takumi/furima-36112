class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_state
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :day_to_ship

  with_options presence: true do
  validates :image
  validates :name
  validates :content
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank"}
  end

  with_options presence: true, numericality: { other_than: 1 , message: "can't be blank"} do
  validates :category_id
  validates :sales_state_id 
  validates :delivery_charge_id 
  validates :prefecture_id 
  validates :day_to_ship_id 
  end
end
