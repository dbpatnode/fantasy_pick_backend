class League < ApplicationRecord
    has_many :joins
    has_many :joined_users, through: :joins, source: :user
end
