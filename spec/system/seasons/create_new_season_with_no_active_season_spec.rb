# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Create new season with no active season" do
  let(:league) { create(:league) }

  before do
    login(league.user)
    expect(Season.count).to eq(0)
  end

  describe "with no other existing seasons" do
    it "creates new season and redirects to league#show" do
      visit league_path(league)

      click_button "New Season"

      expect(page).to have_content("Seasons: 1")
    end
  end

  describe "with existing inactive season" do
    before { create(:season, league: league, active: false) }
    it "creates new season and redirects to league#show" do
      visit league_path(league)

      click_button "New Season"

      expect(page).to have_content("Seasons: 1")
    end
  end
end
