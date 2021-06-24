class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :favorites
  has_many :comments

  attachment :icon

  enum is_active: { '有効': true, '退会': false }

  def active_for_authentication?
    super && (self.is_active == '有効')
  end


  validates :full_name, presence: true
  validates :full_name_kana, presence: true
end
