class UsersController < ApplicationController
  def finish_signup
    # authorize! :update, @user
    if request.patch? && params[:user] #&& params[:user][:email]
      @user = User.find(params[:id])
      if @user.update(user_params)
        # @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to admin_root_path, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  private
  def user_params
    accessible = [ :name, :email ] # extend with your own params
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end
