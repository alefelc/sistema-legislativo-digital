class BlocksController < ApplicationController
  def index
    @blocks = Bloque.all
  end

  def new
  	@block = Bloque.new
  end

  def create
  	@block = Bloque.new block_params
  	if @block.save
      flash[:success] = "El bloque se creo correctamente"
      redirect_to edit_block_path(@block)
    else
      flash[:error] = @block.errors.full_messages
      render :new
    end
  end

  def edit
  	@block = Bloque.find params[:id]
  end

  def update
  	@block = Bloque.find params[:id]
  	if @block.update block_params
      flash[:success] = "Bloque actualizado correctamente"
      redirect_to edit_block_path(@block)
  	else
      flash[:error] = @block.errors.full_messages
      render :edit
  	end
  end

  def destroy
  end

  private
  def block_params
  	params.require(:bloque).permit(:denominacion, periodo_ids: [])
  end
end
