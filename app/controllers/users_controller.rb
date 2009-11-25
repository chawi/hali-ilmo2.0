class UsersController < ApplicationController

	skip_before_filter :login_required, :only => [ :new, :create ]

	def index
		@user = User.users_descending
	end

	def show
			#make general
		#if @logged_user_id == params[:id]
			@user = User.find(params[:id])
		#else
		#	flash[:warning] = "Ai pyrit kielletylle sivulle."
		#	flash.keep
		#	redirect_to courses_path
		#end
	end

	def new
		@user = User.new
	end

	def create

		begin
			user = User.find_by_username(params[:user][:username])
			message = "Tunnus on jo olemassa. Valitse toinen tunnus."
			raise "user_exists" if not user.nil?
			
			message = "Salasanat eivät vastaa toisiaan."
			User.confirm_password(params[:user][:psword], params[:user][:psword_confirmation])

		rescue
			flash[:error] = message
			redirect_to new_user_path
		  return

		end

		user = User.new(params[:user])

		if user.save 
			flash[:notice] = 'Käyttäjä luotu'  
			flash.keep
			redirect_to root_path
		else  
			render :action => "new" 
		end 
		
	end

	def edit
		#ugly
		user = User.find(@logged_user_id)	
		#raise params.inspect	
		if user.update_attributes(params[:user])
			flash[:notice] = "Tiedot päivitetty"			
		end	

			redirect_to user_path(:id=>@logged_user_id)
	end
	
	def destroy
		User.delete(params[:id])
		redirect_to logout_path
	end

end
