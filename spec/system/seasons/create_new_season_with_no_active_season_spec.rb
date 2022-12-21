# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Create new season with no active season" do
  let(:league) { create(:league) }

  before do
    login(league.user)
    expect(Season.count).to eq(0)
  end

  it "Creates new season and redirects to season#show" do
    visit league_path(league)

    click_button "New Season"

    expect(page).to have_content("Seasons: 1")
  end
end
