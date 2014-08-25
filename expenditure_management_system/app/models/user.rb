class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :validate_on_invite => true
  has_many :expenses
  
  has_one :user_detail, dependent: :destroy
  
  accepts_nested_attributes_for  :user_detail
  validates :email, :role, presence: true
  ADMIN = "admin"
  DEVELOPER = "developer"
  OFFICE_ADMIN = "office admin"
  ROLE = [ADMIN, DEVELOPER, OFFICE_ADMIN]
  
  def role?(role)
    return false unless [User::ADMIN, User::OFFICE_ADMIN].include?(role)
    return true
  end
end
