class CcUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cc_likes
  has_many :cc_comments
  #Relación N a N con posts mediante la tabla likes
  has_many :cc_posts, through: :cc_likes

  #Roles
  enum :role, [:cc_normal_user, :cc_admin]
  def role?(role_name)
    self.role == role_name
  end
       
end
