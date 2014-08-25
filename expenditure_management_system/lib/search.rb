module Search
  def search_expenses(category_id, start_date, end_date, review=nil)
    searches = Expense.all
    searches = searches.with_status_approved if review.present?
    searches = searches.with_start_date(start_date) if start_date.present? 
    searches = searches.with_end_date(end_date) if end_date.present?
    searches = searches.with_category(category_id) if category_id.present?
    return searches
  end
end
