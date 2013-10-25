class Admin::UsersController < Admin::BaseController
  def index
  	# look into this
  	@users = User.order(:email)
  end
end
