FactoryBot.define do
  factory :membership do
    user { nil }
    league { nil }
    role { 1 }
    active { false }
  end
end
