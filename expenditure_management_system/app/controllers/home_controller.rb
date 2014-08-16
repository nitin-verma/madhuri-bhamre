class HomeController < ApplicationController
  def index
    @birth_day_users=[]
    @user_details = UserDetail.all
    @user_details.each do |user_detail|
      if user_detail.date_of_birth.present?
        date_of_birth = Date.strptime(user_detail.date_of_birth.to_s, "%Y-%m-%d")
        if date_of_birth.strftime("%m") == Date.today.strftime("%m")
          if date_of_birth.strftime("%d") >= Date.today.strftime("%d")
            @birth_day_users << user_detail
          end
        end
      end
    end
  end
end
