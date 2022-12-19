FactoryBot.define do
  factory :membership do
    user
    league
    role { 1 }
    status { 0 }
  end
end
