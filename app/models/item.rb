class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_state
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :day_to_ship


  validates :image, presence: true
  validates :name, presence: true
  validates :content, presence: true
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank"}
  end

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :sales_state_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :day_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
