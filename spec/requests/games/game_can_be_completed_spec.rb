# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Game can be completed", type: :request do
  let(:game) { create(:game, completed: false) }
  let(:season) { game.season }
  let(:admin) { game.league.user }

  subject(:post_complete) {
    post "/seasons/#{season.id}/games/#{game.id}/complete"
  }

  before { login(admin) }

  it "changes a game's completed attribute to true" do
    post "/seasons/#{season.id}/games/#{game.id}/complete"

    game.reload
    expect(game.completed).to eq(true)
  end

  it "remains true when it's already true" do
    game.update(completed: true)

    post "/seasons/#{season.id}/games/#{game.id}/complete"

    game.reload
    expect(game.completed).to eq(true)
  end
end
