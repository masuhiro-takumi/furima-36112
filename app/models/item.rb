class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_state
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :day_to_ship


  validates :name, presence: true
  validates :content, presence: true
  validates :price, presence: true

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :sales_state_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :day_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
