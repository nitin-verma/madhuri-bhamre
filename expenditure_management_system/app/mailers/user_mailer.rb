class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  def welcome_email(data)
    #@user = user
    #  @url  = 'http://example.com/login'
    email = data[:email]
    subject = get_subject_with_date(data[:start_date],data[:end_date])
    attachments['example.pdf'] = data[:pdf_file]
    mail(to: email, subject: subject)
  end
  private
  
  def get_subject_with_date(start_date, end_date)
    if start_date.present? && end_date.present?
      subject = "Expenses sheet from  #{start_date} to #{end_date}"
    elsif start_date.present?
      subject = "Expenses sheet from  #{start_date} to #{Time.now().strftime("%Y-%m-%d")}"
    elsif end_date.present?
      subject = "Expenses sheet upto #{end_date}"
    else
      subject = "Expenses sheet"
    end
  end
    
end
