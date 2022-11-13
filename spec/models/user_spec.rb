require "rails_helper"

RSpec.describe User, type: :model do
  context "validations & relationships" do
    before { create(:user) }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should have_many :leagues }
  end
end
