class RegistrationsController < ApplicationController

	def create
		#raise params.inspect
		#"exercise_group"=>{"groups"=>"170"}
		#if user already is in some group, remove this and add him again.

		user = User.find(session[:current_user_id])
		eg = ExerciseGroup.find(params[:exercise_group][:groups])
		course = eg.course_instance.course

		reg = Registration.new(:user_id => user.id, :exercise_group_id => eg.id)

		if reg.save 
			flash[:notice] = 'Sinut on lisätty kurssille #{course.name} ryhmään #{eg.name}'  
			flash.keep
			
			redirect_to courses_path
		else  
			
			render :action => "show"
		end 

	end

end
