class Invoice < ActiveRecord::Base

  belongs_to :imageable, polymorphic: true
  
  mount_uploader :receipt_image, ReceiptUploader
  validates :receipt_image, presence: true    
end
