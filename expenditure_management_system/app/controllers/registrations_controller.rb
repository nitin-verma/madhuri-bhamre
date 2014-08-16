class RegistrationsController < Devise::RegistrationsController
  def new
    redirect_to root_path
  #  @user = User.new
   # @user.build_user_detail     
  end
  
  def create
  #  @user = User.new(user_params)
   # if @user.save    
      redirect_to root_path
    #else
    
     # @user.build_user_detail
      #render 'new'
    #end
  end
  
  def edit
    current_user.build_user_detail if current_user.user_detail.blank?
  end  
end
