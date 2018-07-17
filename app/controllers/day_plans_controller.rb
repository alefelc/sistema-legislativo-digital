class DayPlansController < ApplicationController
  def new
    @dayplan = DayPlan.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def index
    @dayplans = DayPlan.order id: :desc
  end
end
