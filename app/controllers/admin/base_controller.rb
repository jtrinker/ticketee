class Admin::BaseController < ApplicationController
	# by creating an admin::basecontroller we can have any new
	# controller we create inside of admin inherit from base
	# and thus get the authorize_admin method
	# we might want a Admin::ProjectsController, etc.
	# this file can also double as an eventual homepage

	before_action :authorize_admin!

	def index
	end
	
end