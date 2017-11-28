class Users::SessionsController < Devise::SessionsController
  skip_filter :authenticate_user!
end
