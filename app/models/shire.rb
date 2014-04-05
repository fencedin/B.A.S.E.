class Shire < ActiveRecord::Base
  has_and_belongs_to_many :battalions
  has_many :events
  validates :name, presence: true,
                   uniqueness: true
end
