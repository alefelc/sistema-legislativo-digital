class BlocksController < ApplicationController
  def index
    @blocks = Bloque.all
  end
end
