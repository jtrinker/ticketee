class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    # put this in application controller because we're going to use in lots of places
  	def authorize_admin!
      user_signed_in?

      unless current_user.admin?
        flash[:alert] = "You must be an admin to do that"
        redirect_to root_path
      end
    end

end
