class LegislativeFileStatesController < ApplicationController
  def new
    @legislative_file_state = LegislativeFile.find(params[:legislative_file_id])
      .legislative_file_states.build

    render layout: false
  end

  def edit
    @legislative_file_state = LegislativeFileState.find params[:id]

    render layout: false
  end
end
