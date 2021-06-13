class Post < ApplicationRecord

  belongs_to :users
  has_many :comments
  has_many :favorites

  belongs_to :genre
  belongs_to :maker

end
