class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :email, presence: true

  def to_s
  	# print email; if admin? print "Admin" else print "User"
  	"#{email} (#{admin? ? "Admin" : "User"})"
  end
end
