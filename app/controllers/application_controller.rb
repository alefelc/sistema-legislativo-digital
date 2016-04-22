class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # Redirect back after sign in and sign out
  after_filter :store_location

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get?
    if (request.path != "/usuarios/sign_in" &&
        request.path != "/usuarios/sign_up" &&
        request.path != "/usuarios/password/new" &&
        request.path != "/usuarios/password/edit" &&
        request.path != "/usuarios/confirmation" &&
        request.path != "/usuarios/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end
end
