# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Create new season with existing active season" do
  let(:season) { create(:season, active: true) }
  let(:league) { season.league }

  before do
    login(league.user)
  end

  it "redirects to a confirmation page" do
    visit league_path(league)

    click_button "New Season"

    expect(page).to have_content(
      "There is another season that is currently active.\nCreating this new season will make that season inactive. Are you sure you want to do this?"
    )
    expect(page).to have_link("No, Thanks")
    expect(page).to have_button("Yes, I'm Sure")
  end

  describe "confirmation page" do
    it "returns to league page for cancel" do
      visit league_seasons_confirmation_path(league)

      click_link "No, Thanks"

      expect(page).to have_content(league.name)
      expect(page).to have_content("Seasons: 1")
    end

    it "redirects to league page with new season" do
      visit league_seasons_confirmation_path(league)

      click_button "Yes, I'm Sure"

      expect(page).to have_content(league.name)
      expect(page).to have_content("Seasons: 2")
    end
  end
end
