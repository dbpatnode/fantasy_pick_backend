class League < ApplicationRecord
    belongs_to :user
    has_many :joins, dependent: :destroy
    has_many :joined_users, through: :joins, source: :user, dependent: :destroy
    validates :league_name, uniqueness: true,  presence: true,  length: { minimum: 5 }

end
