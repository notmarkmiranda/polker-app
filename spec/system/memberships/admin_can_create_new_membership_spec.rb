# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Admin can create new membership", type: :system do
  let(:league) { create(:league) }
  let(:user) { league.user }

  it "creates a new membereship and redirects to membership index" do
    login(user)
    visit new_league_membership_path(league)

    fill_in "Email", with: "newuser@superduper.com"
    click_button "Invite"

    expect(page).to have_content("Pending Memberships")
    expect(page).to have_content("newuser@superduper.com")
  end
end
