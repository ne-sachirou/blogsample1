class Item < ActiveRecord::Base
  validates :title, presence: true, format: { with: /\S/ }
  validates :content, presence: true, format: { with: /\S/ }
end
