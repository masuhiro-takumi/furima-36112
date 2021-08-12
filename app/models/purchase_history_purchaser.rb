class PurchaseHistoryPurchaser
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :token

  VALID_PHONE_REGEX = /\A\d{10,11}\z/
  with_options presence: true do
    validates :municipality
    validates :address
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number,format: {with: VALID_PHONE_REGEX }
  end
  validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    Purchaser.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end
end