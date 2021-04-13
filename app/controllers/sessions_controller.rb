class SessionsController < Devise::SessionsController

  def create
    #debugger
    # @user = User.new(user_params)
    # if @user.save
    #   redirect_to projects_path
    # end
    @user = User.find_by(email: params[:user][:email])
    if @user.present? && !@user.active
      redirect_to new_user_session_path, notice: "Your account is yet to approved!"
    else
      super

    end
  end

  # def user_params
  #   params.require(:user).permit(:email, :password)
  # end

end
