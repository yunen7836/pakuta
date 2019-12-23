class Like < ApplicationRecord
  validates :user_id, presence: true, uniqueness: {scope: :boke_id}
  validates :boke_id, presence: true
  belongs_to :boke
  belongs_to :user
end
