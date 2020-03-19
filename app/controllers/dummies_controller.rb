class DummiesController < ApplicationController

  def new
    @dummy = Dummy.new
  end

  def create
    @dummy = Dummy.create(dummy_params)
  end

  private

  def dummy_params
    params.require(:dummy).permit(:value, :deadline)
  end
end
