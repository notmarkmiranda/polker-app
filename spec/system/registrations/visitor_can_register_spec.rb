require "rails_helper"

RSpec.describe "Visitor can register spec", type: :system do
  it "redirects to dashboard after signing up" do
    visit "/sign-up"

    fill_in "Email Address", with: "testing1234@hufumail.com"
    fill_in "Password", with: "password"
    click_button "Let's Go!"

    expect(page).to have_content("Dashboard")
    expect(page).to have_content("testing1234@hufumail.com")
  end

  it "redirects users logged in from sign up page" do
    user = create(:user)
    login(user)

    visit "/sign-up"

    expect(page).to have_content("Dashboard")
    expect(page).to have_content(user.email)
  end
end
