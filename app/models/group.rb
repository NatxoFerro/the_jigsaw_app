class Group < ActiveRecord::Base
  belongs_to :jigsaw
  has_and_belongs_to_many :users
  attr_accessible :URL, :jigsaw_id
end
