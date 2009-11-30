class Admin::MailerController < AdminController

	def show

	end

	def create
		users = User.with_email

		users.each do |u|
			UserMailer.deliver_ilmo_mail(u, params[:subject], params[:message])
		end
	
		flash[:notice] = "Viestin lähetys onnistui."
		redirect_to admin_mailer_path
	end

end
