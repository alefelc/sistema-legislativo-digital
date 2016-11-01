class ApplicationController < ActionController::Base
  include Pundit

  # Track who is responsible for changes
  before_action :set_paper_trail_whodunnit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception,
    if: Proc.new { |c| c.request.format == 'application/json' }
  # Redirect back after sign in and sign out
  after_filter :store_location

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    session[:previous_url] = request.fullpath if !request.xhr? # don't store ajax calls
  end

  private

  # Overwriting the sign_in redirect path method
  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      if params[:format] == 'json'
        render json: { error: 'Usted no ha ingresado al sistema' }, status: 403
      else
        flash[:error] = 'Usted no ha ingresado al sistema'
        redirect_to(root_path)
      end
    end
  end
end
