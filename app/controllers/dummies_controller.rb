class DummiesController < ApplicationController

  def new
    @dummy = Dummy.new(value: cookies[:last_value], deadline: cookies[:last_deadline])
  end

  def create
    @dummy = Dummy.create(dummy_params)
    cookies[:last_value] = @dummy.value
    cookies[:last_deadline] = @dummy.deadline
  end

  private

  def dummy_params
    params.require(:dummy).permit(:value, :deadline)
  end
end
