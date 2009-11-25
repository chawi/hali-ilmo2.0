class AdminController < ApplicationController

	skip_before_filter :login_required
	#skip_before_filter :set_user_variable

	layout "admin"
	
	#TODO: oma before filtteri vain admineille?



end
