class AdminsController < ApplicationController
  #Allows admins to access all users
    def index 
      @users = User.all
    end
  
    def destroy
      #Sets instance variable to user id 
      @user = User.find(params[:id])
      #Deletes that users account
      @user.destroy
      #Redirects admin back to admin dashboard and renders message
      redirect_to admins_index_path, notice: 'User Deleted.'
    end

    def assign
      #Sets instance variable to user id 
      @user = User.find(params[:id])
      #Changes boolean of admin to that user to true
      @user.admin = true
      #Saves admin change
      @user.save
      #Redirects admin back to admin dashboard and renders message
      redirect_to admins_index_path, notice: 'User is now an Admin.'
    end

end