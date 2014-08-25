class UsersController < ApplicationController
  include Search
  def destroy
    @user = User.find_by(:id => params[:id])
    @user.destroy
    redirect_to user_details_path, notice: "user is successfully deleted"
  end
  
  def send_expense_review
    expenses = search_expenses(params[:category_id], params[:start_date], params[:end_date], true)
    total_expense = get_total_expense(expenses) if expenses.present?
    category = Category.where(id: params[:category_id]).first
    locals = {expenses: expenses, total_expense: total_expense, category: category}
    html = ActionView::Base.new(Rails.configuration.paths["app/views"])
    html = html.render(:partial => 'shared/send_expense_review', :locals => locals )
    kit = PDFKit.new(html,
      :page_size => 'Letter',
      :margin_top => '0.30in',
      :footer_font_size => 10 ,      
    )
    #file = kit.to_file(("#{Rails.root}/public/example.pdf"))
    pdf_file = kit.to_pdf
    send_data(pdf_file, :filename => "examle.pdf", :disposition => 'inline', :type => "application/pdf")

    #@user = User.where(email: params[:email]).first
    data = {email: params[:email], start_date: params[:start_date], end_date: params[:end_date],pdf_file: pdf_file }
    UserMailer.welcome_email(data).deliver # if @user.present?
    flash[:notice] = "mail is sent successfuly"
  end
end
