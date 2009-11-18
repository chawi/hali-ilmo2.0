class User < ActiveRecord::Base

	attr_accessor :psword_confirmation

	#user-luokan luokkametodi, sama kuin def User.authenticate

	def self.authenticate(username, psword)
		
		user = User.find_by_username_and_psword(username, psword)

		raise "user_not_found" if user.nil?
		return user

	end

	def self.confirm_password(psword, psword_confirmation)

		confirmed = psword.eql?(psword_confirmation)

		raise "user_passwords vary" if not confirmed
		return true
	end

end


#unless session[:user]
 #     redirect_to :controller => "login" 
  #    return false
  #  end



