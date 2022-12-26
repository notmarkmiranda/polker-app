FactoryBot.define do
  factory :game do
    season
    date_time { "2022-12-25 19:08:19" }
    estimated_player_count { 6 }
    location { "Centennial, CO" }
    completed { false }
    buy_in { 15 }
    add_ons { false }
    payout_schedule { { "1" => 50, "2" => 30, "3" => 20 } }
  end
end
