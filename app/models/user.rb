class User < ApplicationRecord
    has_secure_password

    has_many :leagues
    has_many :joins
    has_many :picks
    has_many :matches, through: :picks
    has_many :joined_leagues, through: :joins, source: :league

    
end
