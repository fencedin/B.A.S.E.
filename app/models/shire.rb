class Shire < ActiveRecord::Base
  has_and_belongs_to_many :battalions
  validates :name, presence: true,
                   uniqueness: true
end
