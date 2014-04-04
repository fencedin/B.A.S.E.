class Battalion < ActiveRecord::Base
  has_and_belongs_to_many :shires
end
