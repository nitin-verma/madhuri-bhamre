class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.all
  end
  
  def update
    if current_user.update_attributes(user_params)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  
  def destroy
    @user = User.find_by(:id => params[:id])
    @user.destroy
    redirect_to users_path, notice: "category is successfully deleted"
  end
  
  private 
  def user_params
    params.require(:user).permit(:user_detail_attributes => [:name, :address, :phone, :date_of_birth])
  end
end
