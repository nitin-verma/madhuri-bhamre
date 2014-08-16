class ExpensesController < ApplicationController
  load_and_authorize_resource
  skip_before_filter :verify_authenticity_token, :only => :status_update

  def index
    get_expense_object
    @categories = Category.all
  end
  
  def new
    @expense = Expense.new
    @categories = Category.all
  end
  
  def create
    @expense = current_user.expenses.new(expense_params.merge(status: Expense::INPROCESS ))
    if @expense.save    
      redirect_to expenses_path
    else
      @categories = Category.all
      render 'new'
    end
  end
  
  def edit
    @expense = Expense.where(:id => params[:id]).first
    @categories = Category.all
  end
    
  def update 
    @expense = Expense.where(id: params[:id]).first
    unless @expense.status == Expense::APPROVED
      @expense.update_attributes(expense_params) 
    else
      @expense.update_attributes(expense_updated_params) 
    end
    redirect_to expenses_path
  end
  
  def status_update
    @expense = Expense.where(id: params[:id]).first
    @expense.update_attributes(status: get_valid_status, explanation: get_explanation) 
    get_expense_object    
  end
    
  def get_valid_status
    Expense::EXPENSE_STATUSES.include?(params[:status])? params[:status] : Expense::INPROCESS
  end
  
  def search_by_category
  end
  
  def get_explanation
    Expense::EXPENSE_STATUSES.include?(params[:status]) ? params[:explanation] : ""
  end
  
  private
  def expense_params
    params.require(:expense).permit(:name, :date, :category_id, :number_of_item, :price_per_item, :description)
  end
  
  def expense_updated_params
    params.require(:expense).permit(:name, :date, :category_id, :number_of_item, :price_per_item, :description, :invoices_attributes => [:id, :receipt_image])
  end
  
  def get_expense_object
    @expenses = Expense.includes(:category).page(params[:page]).order('id desc')
  end
end
