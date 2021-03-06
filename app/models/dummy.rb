class Dummy < ApplicationRecord
  before_create { Dummy.destroy_all }
  after_create_commit { ExchangeRate.find_by(char_code: "USD").update(fake_value: value) }
  after_create_commit { DeleteDummyJob.set(wait_until: deadline).perform_later(self) }
  after_destroy { ExchangeRate.find_by(char_code: "USD").update(fake_value: nil) }

  validates :value, :deadline, presence: true
  validates :value, numericality: { greater_than: 0 }
  validate :validate_deadline_is_valid_time

  private

  def validate_deadline_is_valid_time
    errors.add(:deadline, 'must be a valid datetime') unless deadline.is_a?(Time) && deadline > Time.now
  end
end
