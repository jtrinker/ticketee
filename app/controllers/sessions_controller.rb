class SessionsController < ApplicationController
  def new
  end

  def create
  	# pulling out the name entered into the :signin form
  	user = User.where(name: params[:signin][:name]).first
  	# if != nil AND the user's password is correct
  	if user && user.authenticate(params[:signin][:password])
  		# ex. session.create(user_id: 4)
  		session[:user_id] = user.user_id
  		flash[:notice] = "Signed in Successfully."
  		redirect_to root_url
  	else
  		flash[:error] = "You shall not pass!"
  		render :new
  	end
  end
end

session.create(user_id: 4)
