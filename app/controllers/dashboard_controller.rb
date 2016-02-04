class DashboardController < ApplicationController
  # before_action :authenticate_usuario!

  respond_to :json
  def index

  end

  def search
      render json: [{name: "roli"},{name: "leo"}]
  end

end
