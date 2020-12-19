class Pick < ApplicationRecord
  belongs_to :user
  belongs_to :match

  # validates :winner , presence: true
  validates :match_id, uniqueness: { scope: :user,
      message: "You already pick this match" }
end
  