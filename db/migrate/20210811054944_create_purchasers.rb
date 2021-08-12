class CreatePurchasers < ActiveRecord::Migration[6.0]
  def change
    create_table :purchasers do |t|

      t.string        :postal_code,        null: false
      t.integer       :prefecture_id,      null: false
      t.string        :municipality,       null: false
      t.string        :address,            null: false
      t.string        :building_name
      t.string        :phone_number,       null: false
      t.references    :purchase_history,    null: false, foreeign_key: true
      t.timestamps
    end
  end
end
