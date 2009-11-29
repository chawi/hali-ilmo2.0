class Admin::UsersController < AdminController

	active_scaffold :users

#active_scaffold :user do |config|
	#config.columns.exclude :hashed_password
	#config.columns.add :password, :password_confirmation
	#config.list.columns.exclude, :password, :password_confirmation
#end

end
