class UsersController < ApplicationController
	before_action :setup_user, only: [:show, :edit, :update, :destroy]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		flash[:notice] = "You have signed up successfully."
  		redirect_to @user
  	else
  		render :new
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @user.update(user_params)
  		flash[:notice] = "User info has been updated."
  		redirect_to @user
  	else
  		flash[:alert] = "Updates to profile failed to save."
  		redirect_to :edit
  	end
  end

  def destroy
  end

  private

  	def setup_user
  		@user = User.find(params[:id])
  	end

  	def user_params
  		params.require(:user).permit(:name, :password, :password_confirmation)
  	end
end
