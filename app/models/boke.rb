class Boke < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :likes, dependent: :destroy
end
