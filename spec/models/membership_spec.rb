require 'rails_helper'

RSpec.describe Membership, type: :model do
  it { should belong_to :user }
  it { should belong_to :league }
  role_enum = { member: 0, admin: 1}
  it { should define_enum_for(:role).with_values(role_enum) }
end
