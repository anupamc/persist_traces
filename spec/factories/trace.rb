FactoryGirl.define do
  factory :trace do
    latitude { Faker::Number.decimal(2, 12) }
    longitude { Faker::Number.decimal(2, 12).prepend('-') }
  end
end