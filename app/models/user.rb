class User < ApplicationRecord
    has_secure_password

    has_many :leagues
    has_many :joins
    has_many :picks
    has_many :matches, through: :picks
    has_many :joined_leagues, through: :joins, source: :league

    validates :email, uniqueness: { case_sensitive: false }, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :username, uniqueness: { case_sensitive: false }
    
end
