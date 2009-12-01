class User < ActiveRecord::Base

	attr_accessor :psword_confirmation

	has_many :registrations
	has_many :exercise_groups, :through => :registrations

	named_scope :users_ascending, :order => "username ASC"
	named_scope :users_descending, :order => "username DESC"
	named_scope :with_email, :conditions => "email IS NOT NULL"
	
  validates_length_of :username, :in => 3..15
  validates_length_of :realName, :in => 3..50, :allow_blank => true
  
  validates_length_of :psword, :in => 5..30, :allow_blank => true, :on => :update
  validates_length_of :psword, :in => 5..30, :on => :create
  validates_confirmation_of :psword
  
  validates_length_of :studentId, :is => 9, :allow_blank => true

	after_create :update_newsfeed

	private
	
	def update_newsfeed
		Newsfeed.user_registered(self)
	end

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




