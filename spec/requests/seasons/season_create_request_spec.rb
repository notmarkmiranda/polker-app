# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Season Create", type: :request do
  let(:league) { create(:league) }
  subject(:post_create) { post "/leagues/#{league.id}/seasons" }

  it "creates a new season when no seasons exist" do
    expect { post_create }.to change(Season, :count).by(1)
  end

  it "creates a new season when no active seasons exist" do
    create(:season, league: league, active: false)

    expect { post_create }.to change(Season, :count).by(1)
  end

  it "does not create a new season and redirects to confirmation path when active season exists" do
    create(:season, league: league, active: true)

    expect { post_create }.to change(Season, :count).by(0)
  end
end
