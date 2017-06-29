class PeriodsController < ApplicationController
  def index
    @periods = Periodo.all
  end
end
