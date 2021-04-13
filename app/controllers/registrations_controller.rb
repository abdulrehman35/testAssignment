class RegistrationsController < Devise::RegistrationsController

	def create
		debugger
		@user = User.new(user_params)
		if @user.save
			redirect_to projects_path, notice: "User created successfully."
		end
	end

	def user_params
	  params.require(:user).permit(:name, :email, :password, :password_confirmation, role_ids: [])
	end

end
