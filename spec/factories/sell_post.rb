FactoryBot.define do
  factory :sell_post do
    title { Faker::Vehicle.make_and_model + " " + Faker::Vehicle.mileage.to_s}
    user_id {"foo@nomail.com"}
    content { "come and see!!!" }
    price {Faker::Commerce.price}
  end
end