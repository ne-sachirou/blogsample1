require 'rails_helper'

RSpec.describe Item, :type => :model do
  describe 'migrate' do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:title).of_type(:string).with_options(null:false) }
    it { should have_db_column(:content).of_type(:text).with_options(null:false) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(null:false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(null:false) }
  end

  describe 'validation' do
    it 'titleは必須です' do
      topic = FactoryGirl.build :item, title: ''
      expect(topic.valid?).to be_falsey
      expect(topic.save).to be_falsey
    end

    it 'contentは必須です' do
      topic = FactoryGirl.build :item, content: ''
      expect(topic.valid?).to be_falsey
      expect(topic.save).to be_falsey
    end
  end
end
