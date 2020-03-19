require 'rails_helper'

RSpec.describe Dummy, type: :model do
  it { should validate_presence_of :value }
  it { should validate_presence_of :deadline }
  it { should validate_numericality_of(:value) }

  describe '#validate_deadline_is_datetime' do
    it 'deadline is datetime' do
      expect(Dummy.new(value: 42.00, deadline: Time.now)).to be_valid
    end
    it 'deadline is NOT datetime' do
      expect(Dummy.new(value: 42.00, deadline: "aliluya")).to_not be_valid
    end
  end
end
