require "rails_helper"

RSpec.describe "Leagues Create", type: :request do
  let(:league_params) { attributes_for(:league) }
  subject(:post_create) { post "/leagues", params: {league: league_params} }

  before { login }

  it "creates a new league" do
    expect { post_create }.to change(League, :count).by(1)
  end

  it "creates a new season" do
    expect { post_create }.to change(Season, :count).by(1)
  end
end
