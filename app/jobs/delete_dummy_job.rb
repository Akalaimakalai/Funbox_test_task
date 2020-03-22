class DeleteDummyJob < ApplicationJob
  queue_as :default

  def perform(dummy)
    dummy.destroy
  end
end
