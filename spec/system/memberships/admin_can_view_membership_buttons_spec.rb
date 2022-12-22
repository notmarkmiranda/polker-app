# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Admin can view membership buttons", type: :system do
  let(:league) { create(:league) }

  before do
    Membership.statuses.keys.each do |status_key|
      create(:membership, league: league, status: status_key)
    end
  end

  describe "when the user is the creator" do
    it "shows the buttons on the membership buttons" do
      login(league.user)

      visit league_memberships_path(league)

      expect(page).to have_button("MOVE TO PENDING").twice
      expect(page).to have_button("REJECT")
      expect(page).to have_button("ARCHIVE")
    end
  end

  describe "when the user is an admin" do
    let(:admin) { create(:membership, status: :active, role: 1, league: league).user }

    it "shows the buttons on the membership buttons" do
      login(admin)

      visit league_memberships_path(league)

      expect(page).to have_button("MOVE TO PENDING").twice
      expect(page).to have_button("REJECT")
      expect(page).to have_button("ARCHIVE")
    end
  end

  describe "when the user is a regular user" do
    let(:user) { create(:membership, status: :active, role: 0, league: league).user }

    it "shows the buttons on the membership buttons" do
      login(user)

      visit league_memberships_path(league)

      expect(page).to have_content("Memberships for #{league.name}")

      expect(page).not_to have_button("MOVE TO PENDING").twice
      expect(page).not_to have_button("REJECT")
      expect(page).not_to have_button("ARCHIVE")
    end
  end
end
