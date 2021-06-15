class Post < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_many :favorites

  belongs_to :genre
  belongs_to :maker

  attachment :image

  validates :genre_id, presence: true
  validates :maker_id, presence: true
  validates :name, presence: true
  validates :image, presence: true
  validates :introduction, presence: true

end
