class Expense < ActiveRecord::Base
 
  belongs_to :user
  belongs_to :category
  has_many :invoices , as: :imageable
 
  INPROCESS = "In process"
  APPROVED = "approved"
  CANCELED = "canceled"
  EXPENSE_STATUSES = [APPROVED, CANCELED]
 
  validates :name, :date, :category, :number_of_item, :price_per_item, presence: true 
 
  self.per_page = 10
 
  accepts_nested_attributes_for  :invoices
  scope :with_status_approved , -> {where(status: APPROVED)}
    
  scope :with_start_date, lambda{ |start_date|
    where("date >= ?", start_date)
  }
  
  scope :with_end_date, lambda{ |end_date|
    where("date <= ?", end_date)
  }
  
  scope :with_category, lambda{ |category_id|
    where(category_id: category_id)
  }
 
  
end
