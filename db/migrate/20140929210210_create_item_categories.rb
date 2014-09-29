class CreateItemCategories < ActiveRecord::Migration
  def change
    create_table :item_categories do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_reference :items, :item_category, index: true
  end
end
