# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Game can be completed", type: :request do
  let(:game) { create(:game, completed: true) }
  let(:season) { game.season }
  let(:admin) { game.league.user }

  subject(:post_complete) {
    post "/seasons/#{season.id}/games/#{game.id}/uncomplete"
  }

  before { login(admin) }

  it "changes a game's completed attribute to true" do
    post "/seasons/#{season.id}/games/#{game.id}/uncomplete"

    game.reload
    expect(game.completed).to eq(false)
  end

  it "remains true when it's already true" do
    game.update(completed: false)

    post "/seasons/#{season.id}/games/#{game.id}/uncomplete"

    game.reload
    expect(game.completed).to eq(false)
  end
end
