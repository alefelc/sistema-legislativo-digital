class TagsController < ApplicationController
  def index
    render json: build_index_response
  end

  private

  def build_index_response
    if params[:select_q].present?
      q = "%#{params[:select_q]}%"
      w = "name ilike ?"
      Tag.where(w, q).limit(20).as_json only: :id, methods: :text
    end
  end
end
