# frozen_string_literal: true

require "rails_helper"

RSpec.describe League, type: :model do
  context "validations & relationships" do
    before { create(:league) }

    it { should belong_to :user }
    it { should have_many :memberships }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  end
end
