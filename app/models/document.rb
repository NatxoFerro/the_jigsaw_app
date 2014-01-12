class Document < ActiveRecord::Base
  belongs_to :resource, polymorphic: true
  attr_accessible :URL, :description, :name, :URL, :resource_id, :resource_type
end
