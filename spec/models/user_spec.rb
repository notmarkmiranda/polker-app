require "rails_helper"

RSpec.describe User, type: :model do
  before { create(:user) }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
end
