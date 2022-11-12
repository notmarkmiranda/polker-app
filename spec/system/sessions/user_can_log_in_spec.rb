# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User can log in", type: :system do
  let(:user) { create(:user) }

  it "redirects the user to dashboard" do
    visit "/sign-in"

    fill_in "Email Address", with: user.email
    fill_in "Password", with: "password"
    click_button "Let's Go!"

    expect(page).to have_content("Dashboard")
    expect(page).to have_content(user.email)
  end

  it "returns user to log in page with invalid credentials" do
    visit "/sign-in"

    fill_in "Email Address", with: user.email
    fill_in "Password", with: "passworrrrd"
    click_button "Let's Go!"

    expect(page).to have_content("Sign In!")
    expect(page).not_to have_content("Dashboard")
  end
end
