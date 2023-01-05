# frozen_string_literal: true

require "rails_helper"

RSpec.describe Player, type: :model do
  it { should belong_to :game }
  it { should belong_to :user }
end
