require 'rails_helper'

RSpec.describe ItemCategory, :type => :model do
  describe 'migrate' do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:name).of_type(:string).with_options(null:false) }
    it { should have_many(:items) }
  end

  describe 'validation' do
    it 'nameは必須です' do
      category = FactoryGirl.build :item_category, name: ''
      expect(category.valid?).to be_falsey
      expect(category.save).to be_falsey
    end
  end
end
