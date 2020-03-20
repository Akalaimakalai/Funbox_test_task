class DieDummyJob < ApplicationJob
  queue_as :default

  def perform(dummy)
    dummy.destroy
  end
end
