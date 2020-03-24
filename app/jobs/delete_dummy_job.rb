class DeleteDummyJob < ApplicationJob
  queue_as :default

  def perform(dummy)
    dummy.destroy if dummy.persisted?
  end
end
