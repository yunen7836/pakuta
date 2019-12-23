class Question < ApplicationRecord
  validates :title, presence: true, unless: :image?
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :bokes, dependent: :destroy
  has_many :likes

  def self.create_likesorder
    Question.find(Like.group(:boke_id).order('count(boke_id) desc').limit(10).pluck(:question_id))
  end
end
