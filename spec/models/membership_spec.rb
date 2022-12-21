require "rails_helper"

RSpec.describe Membership, type: :model do
  it { should belong_to :user }
  it { should belong_to :league }
  role_enum = {member: 0, admin: 1}
  it { should define_enum_for(:role).with_values(role_enum) }
  status_enum = {pending: 0, active: 1, rejected: 2, archived: 3}
  it { should define_enum_for(:status).with_values(status_enum) }

  describe "membership transition methods" do
    context "#can_be_pending?" do
      it "returns true" do
        ["rejected", "archived"].each do |status|
          membership = create(:membership, status: status)

          expect(membership.can_be_pending?).to eq(true)
        end
      end

      it "returns false" do
        ["pending", "active"].each do |status|
          membership = create(:membership, status: status)

          expect(membership.can_be_pending?).to eq(false)
        end
      end
    end

    context "#can_be_active?" do
      it "returns true" do
        ["pending"].each do |status|
          membership = create(:membership, status: status)

          expect(membership.can_be_active?).to eq(true)
        end
      end

      it "returns false" do
        ["active", "rejected", "archived"].each do |status|
          membership = create(:membership, status: status)

          expect(membership.can_be_active?).to eq(false)
        end
      end
    end

    context "#can_be_rejected?" do
      it "returns true" do
        ["pending"].each do |status|
          membership = create(:membership, status: status)

          expect(membership.can_be_rejected?).to eq(true)
        end
      end

      it "returns false" do
        ["active", "rejected", "archived"].each do |status|
          membership = create(:membership, status: status)

          expect(membership.can_be_rejected?).to eq(false)
        end
      end
    end

    context "#can_be_archived?" do
      it "returns true" do
        ["active"].each do |status|
          membership = create(:membership, status: status)

          expect(membership.can_be_archived?).to eq(true)
        end
      end

      it "returns false" do
        ["pending", "rejected", "archived"].each do |status|
          membership = create(:membership, status: status)

          expect(membership.can_be_archived?).to eq(false)
        end
      end
    end
  end
end
