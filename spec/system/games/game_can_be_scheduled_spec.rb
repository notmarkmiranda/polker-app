# frozen_string_literal: true

require "rails_helper"

RSpec.shared_examples "schedule game" do
  it "schedules a game" do
    action

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
    click_button "Schedule Game"

    expect(page).to have_content("May 09, 2023")
    expect(page).to have_content("7:15 PM")
  end
end

RSpec.describe "Game can be scheduled", type: :system do
  let(:season) { create(:season, active: true) }
  let(:league) { season.league }
  let(:admin) { league.user }

  before { login(admin) }

  it_behaves_like "schedule game" do
    let(:action) do
      visit "/seasons/#{season.id}"
      click_link "Schedule Game"
    end
  end

  let(:new_season) { create(:season, league: league, active: false) }

  it_behaves_like "schedule game" do
    let(:action) do
      visit "/seasons/#{new_season.id}"
      click_link "Schedule Game"
    end
  end

  it_behaves_like "schedule game" do
    let(:action) do
      visit "/leagues/#{league.id}"
      click_link "Schedule Game in Active Season"
    end
  end
end
