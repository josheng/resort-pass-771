class DayPassesController < ApplicationController
  def show
    @daypass = DayPass.find(params[:id])
  end
end
