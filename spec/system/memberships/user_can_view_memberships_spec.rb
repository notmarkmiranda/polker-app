require "rails_helper"

RSpec.describe "User can view memberships", type: :system do
  let(:user) { create(:user) }
  let(:leagues) { create_list(:league, 4) }
  before { login(user) }

  describe "when memberships exist" do
    before do
      Membership.statuses.keys.each_with_index do |status, index|
        Membership.create(league: leagues[index], status: status, user: user)
      end
    end

    it "shows all memberships for a user" do
      visit "/memberships"

      expect(page).to have_content("Your League Memberships")
      expect(page).to have_content("Pending Memberships")
      expect(page).to have_content("Active Memberships")
      expect(page).to have_content("Rejected Memberships")
      expect(page).to have_content("Archived Memberships")
    end
  end

  describe "when memberships do not exist" do
    it "does not show any headings" do
      visit "/memberships"

      expect(page).to have_content("Your League Memberships")
      expect(page).not_to have_content("Pending Memberships")
      expect(page).not_to have_content("Active Memberships")
      expect(page).not_to have_content("Rejected Memberships")
      expect(page).not_to have_content("Archived Memberships")
    end
  end
end
