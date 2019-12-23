class Question < ApplicationRecord
  validates :title, presence: true, unless: :image?
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :bokes, dependent: :destroy
  has_many :likes
end
