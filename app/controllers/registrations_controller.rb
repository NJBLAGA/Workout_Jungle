class RegistrationsController < Devise::RegistrationsController
    #Extending from devise lib
    private
   
    #Sign up method, added username to be permitted
    def sign_up_params
     params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
   
     #Update account/user method
    def account_update_params
     params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
    end
   
   end

