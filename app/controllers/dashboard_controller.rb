class DashboardController < ApplicationController
  # before_action :authenticate_user!

  respond_to :json
  def index

  end

  def search
      render json: [{name: "roli"},{name: "leo"}]
  end

end
