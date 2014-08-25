class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  def is_admin?
    if current_user.role == User::ADMIN
      return true
    else 
      redirect_to root_path
    end
  end
  
  def get_total_expense(expenses)
    total = 0
    expenses.each do |expense|
      total = total + expense.number_of_item * expense.price_per_item
    end
    return total
  end
end
