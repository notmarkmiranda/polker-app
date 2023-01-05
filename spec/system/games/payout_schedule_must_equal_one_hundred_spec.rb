# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Payout schedule must equal 100", type: :system do
  let(:season) { create(:season) }
  let(:admin) { season.league.user }

  before { login(admin) }

  it "has an enabled 'Schedule Game' button when the payout schedule equals 100%" do
    visit new_season_game_path(season)

    within "#game_date_time_1i" do
      find("option[value='2023']").click
    end
    within "#game_date_time_2i" do
      find("option[value='5']").click
    end
    within "#game_date_time_3i" do
      find("option[value='9']").click
    end
    within "#game_date_time_4i" do
      find("option[value='19']").click
    end
    within "#game_date_time_5i" do
      find("option[value='15']").click
    end

    fill_in "Estimated Player Count", with: "6"
    fill_in "Location", with: "123 Fake Street, Denver, CO 80219"
    fill_in "Buy In", with: "250"
    check "Allow Rebuys?"

    within "#payout_schedule" do
      find("option[value='4']").click
    end

    fill_in "game[payout_schedule][1]", with: "50"
    fill_in "game[payout_schedule][2]", with: "30"
    fill_in "game[payout_schedule][3]", with: "15"
    fill_in "game[payout_schedule][4]", with: "5"

    expect(page).to have_button("Schedule Game", disabled: false)
  end

  it "has a disabled 'Schedule Game' button when the payout schedule is less than 100%" do
    visit new_season_game_path(season)

    within "#game_date_time_1i" do
      find("option[value='2023']").click
    end
    within "#game_date_time_2i" do
      find("option[value='5']").click
    end
    within "#game_date_time_3i" do
      find("option[value='9']").click
    end
    within "#game_date_time_4i" do
      find("option[value='19']").click
    end
    within "#game_date_time_5i" do
      find("option[value='15']").click
    end

    fill_in "Estimated Player Count", with: "6"
    fill_in "Location", with: "123 Fake Street, Denver, CO 80219"
    fill_in "Buy In", with: "250"
    check "Allow Rebuys?"

    within "#payout_schedule" do
      find("option[value='4']").click
    end

    fill_in "game[payout_schedule][1]", with: "50"
    fill_in "game[payout_schedule][2]", with: "30"
    fill_in "game[payout_schedule][3]", with: "15"
    fill_in "game[payout_schedule][4]", with: "4"

    expect(page).to have_button("Schedule Game", disabled: true)
  end

  it "has a disabled 'Schedule Game' button when the payout schedule is greater than 100%" do
    visit new_season_game_path(season)

    within "#game_date_time_1i" do
      find("option[value='2023']").click
    end
    within "#game_date_time_2i" do
      find("option[value='5']").click
    end
    within "#game_date_time_3i" do
      find("option[value='9']").click
    end
    within "#game_date_time_4i" do
      find("option[value='19']").click
    end
    within "#game_date_time_5i" do
      find("option[value='15']").click
    end

    fill_in "Estimated Player Count", with: "6"
    fill_in "Location", with: "123 Fake Street, Denver, CO 80219"
    fill_in "Buy In", with: "250"
    check "Allow Rebuys?"

    within "#payout_schedule" do
      find("option[value='4']").click
    end

    fill_in "game[payout_schedule][1]", with: "50"
    fill_in "game[payout_schedule][2]", with: "30"
    fill_in "game[payout_schedule][3]", with: "15"
    fill_in "game[payout_schedule][4]", with: "6"

    expect(page).to have_button("Schedule Game", disabled: true)
  end
end
