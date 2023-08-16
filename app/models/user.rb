class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :ame, :pronfile, :occupation, :position, presence: true 
  has_many :comments
  has_many :prototypes, dependent: :destroy
end