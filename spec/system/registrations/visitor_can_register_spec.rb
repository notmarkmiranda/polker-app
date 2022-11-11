require "rails_helper"

RSpec.describe "Visitor can register spec", type: :system do
  before { driven_by :rack_test }

  it "redirects to dashboard after signing up" do
    visit '/sign-up'

    fill_in "Email Address", with: "testing1234@hufumail.com"
    fill_in "Password", with: "password"
    click_button "Let's Go!"

    expect(page).to have_content("Dashboard")
  end
end
