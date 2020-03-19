require 'rails_helper'

RSpec.describe Dummy, type: :model do
  it { should validate_presence_of :value }
  it { should validate_presence_of :deadline }
  it { should validate_numericality_of(:value).is_greater_than(0) }

  describe '#validate_deadline_is_datetime' do

    it 'deadline is valid datetime' do
      expect(Dummy.new(value: 42.00, deadline: 1.hour.from_now)).to be_valid
    end

    it 'deadline is invalid datetime' do
      expect(Dummy.new(value: 42.00, deadline: 1.hour.ago)).to_not be_valid
    end

    it 'deadline is NOT datetime' do
      expect(Dummy.new(value: 42.00, deadline: "aliluya")).to_not be_valid
    end
  end
end
