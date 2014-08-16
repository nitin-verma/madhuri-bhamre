class InvoicesController < ApplicationController
  load_and_authorize_resource
  skip_before_filter :verify_authenticity_token, :only => :create
  
  def index
    @expense = Expense.where(id: params[:expense_id]).first
  end
 
  def create
   debugger
    @expense = Expense.where(id: params[:expense_id]).first
    @invoices = @expense.invoices.build(invoice_params)
    @invoices.save    
    @expense = Expense.all
  end
 
  private
  
  def invoice_params
    params.require(:invoice).permit(:receipt_image)
  end
  
end
