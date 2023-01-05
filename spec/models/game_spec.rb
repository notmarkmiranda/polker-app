require "rails_helper"

RSpec.describe Game, type: :model do
  it { should belong_to :season }
  it { should have_many :players }
end
