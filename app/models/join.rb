class Join < ApplicationRecord
  belongs_to :user
  belongs_to :league

  validates :league_id, uniqueness: { scope: :user,
  message: "You already pick this league" }
end
