class HikeType < ActiveRecord::Base
  self.inheritance_column = :_type_disabled
  has_many :hikes
end
