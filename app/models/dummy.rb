class Dummy < ApplicationRecord
  validates :value, :deadline, presence: true
  validates :value, numericality: true
  validate :validate_deadline_is_datetime

  private

  def validate_deadline_is_datetime
    errors.add(:deadline, 'must be a valid datetime') unless deadline.is_a?(Time)
  end
end
