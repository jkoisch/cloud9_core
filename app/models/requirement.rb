class Requirement < ActiveRecord::Base
  belongs_to :requireable, polymorphic: true
  # Type stuff here
end