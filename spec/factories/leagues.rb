FactoryBot.define do
  factory :league do
    sequence(:name) { |n| "#{Faker::Superhero.name} #{n}" }
    location { Faker::Address.city }
    is_public { false }
    user
  end
end
