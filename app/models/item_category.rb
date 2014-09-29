class ItemCategory < ActiveRecord::Base
  has_many :items
  validates :name, presence: true, format: { with: /\S/ }
end
