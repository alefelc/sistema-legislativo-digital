class Devise::SessionsController < DeviseController
  skip_before_filter :authenticate_user
end
