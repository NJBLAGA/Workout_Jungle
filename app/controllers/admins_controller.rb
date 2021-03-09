class AdminsController < ApplicationController
    def index 
      @users = User.all
    end
  
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admins_index_path, notice: 'User Deleted.'
    end

end