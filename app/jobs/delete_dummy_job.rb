class DeleteDummyJob < ApplicationJob
  queue_as :default

  def perform(dummy)
    dummy.destroy if Dummy.all.include?(dummy)
  end
end
