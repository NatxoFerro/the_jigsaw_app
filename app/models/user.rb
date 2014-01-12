class User < ActiveRecord::Base
  has_many :jigsaws, dependent: :destroy
  has_many :documents, as: :resource, dependent: :destroy
  has_and_belongs_to_many :groups
  
  attr_accessible :URL, :name, :surname1, :surname2, :photo, :email, :tipe, :class_group, :nick, :password
end
