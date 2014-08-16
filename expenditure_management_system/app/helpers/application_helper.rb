module ApplicationHelper
  def alert_helper errors
    unless errors.blank?
      "<div class='alert alert-danger'>#{errors.join(', ')}</div>".html_safe
    end
  end
end
