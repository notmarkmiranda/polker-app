# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User can create league", type: :system do
  let(:name) { Faker::Superhero.name }

  before { login }

  it "creates a new league and redirects to league show" do
    visit "/leagues/new"

    fill_in "Name", with: name
    fill_in "Location", with: "#{Faker::Address.city}, CO"
    check "Public League", allow_label_click: true
    click_button "Create League"

    expect(page).to have_content(name)
    expect(page).to have_content("Seasons: 1")
  end
end
