FactoryBot.define do
  factory :purchase_history_purchaser do
    prefecture_id        {2}
    postal_code          {'111-1111'}
    municipality         {"千代田区"}
    address              {"神田和泉町"}
    building_name        {"fkビルディング"}
    phone_number         {'08011111111'}
    token                {"tok_abcdefghijk00000000000000000"}
  end
end
