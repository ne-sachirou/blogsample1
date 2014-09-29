class Item < ActiveRecord::Base
  belongs_to :item_category
  validates :title, presence: true, format: { with: /\S/ }
  validates :content, presence: true, format: { with: /\S/ }
  paginates_per 7
end
