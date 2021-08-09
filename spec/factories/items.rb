FactoryBot.define do

  factory :item do
    association :user
    name                {"tomato"}
    content             {"プチトマト"}
    category_id         {2}
    sales_state_id      {2}
    delivery_charge_id  {2}
    prefecture_id       {2}
    day_to_ship_id      {2}
    price               {500}

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end

end
