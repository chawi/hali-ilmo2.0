class User < ActiveRecord::Base

	attr_accessor :psword_confirmation

	has_many :registrations
	has_many :exercise_groups, :through => :registrations

	named_scope :users_ascending, :order => "username ASC"
	named_scope :users_descending, :order => "username DESC"

  validates_length_of :username, :in => 3..15
  validates_length_of :name, :in => 3..50, :allow_blank => true
  
  validates_length_of :password, :in => 5..30, :allow_blank => true, :on => :update
  validates_length_of :password, :in => 5..30, :on => :create
  validates_confirmation_of :password
  
  validates_length_of :student_number, :is => 9, :allow_blank => true


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




