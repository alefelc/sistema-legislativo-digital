class CommissionsController < ApplicationController
  def index
    @commissions = Comision.all
  end
end
