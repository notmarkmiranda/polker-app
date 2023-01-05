FactoryBot.define do
  factory :player do
    game
    user
    finishing_place { nil }
    score { nil }
    additional_expense { 0 }
    finished_at { nil }
    finishing_order { nil }
    payout { nil }
  end
end
