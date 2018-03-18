class Entry < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :titulo, presence: true
  validates :bajada, presence: true
  validates :cuerpo, presence: true

end
