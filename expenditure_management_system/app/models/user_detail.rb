class UserDetail < ActiveRecord::Base
  belongs_to :user
  validates :name, :address, :phone, presence: true
end
