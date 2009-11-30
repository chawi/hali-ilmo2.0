class UserMailer < ActionMailer::Base

	def ilmo_mail(user, mail_subject, mail_message)  
		recipients user.email 
		from "LoL-Ilmo 2.0"  		
		subject mail_subject  
		sent_on Time.now 
		body :user => user, :message_body => mail_message 
	end  

end
