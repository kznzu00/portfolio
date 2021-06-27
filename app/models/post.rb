class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  belongs_to :genre
  belongs_to :maker

  attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :genre_id, presence: true
  validates :maker_id, presence: true
  validates :name, presence: true
  validates :image, presence: true
  validates :introduction, presence: true

end
