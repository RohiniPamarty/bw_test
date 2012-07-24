class User < ActiveRecord::Base
has_one :authorization
has_many :posts
validates :name, :email, :presence => true
end
