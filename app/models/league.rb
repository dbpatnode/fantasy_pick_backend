class League < ApplicationRecord
    belongs_to :user
    has_many :joins
    has_many :joined_users, through: :joins, source: :user
    validates :name, uniqueness: true,  presence: true,  length: { minimum: 5 }

end
