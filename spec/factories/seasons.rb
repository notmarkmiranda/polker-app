FactoryBot.define do
  factory :season do
    league
    active { true }
    completed { false }
    number_of_games { 0 }
  end
end
