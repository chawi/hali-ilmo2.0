class AdminController < ApplicationController

	skip_before_filter :set_user_variable
	

	layout "admin"

end
