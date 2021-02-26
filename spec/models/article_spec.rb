require 'rails_helper'

RSpec.describe Article, type: :model do
  subject {
    described_class.new
  }

  describe 'validations' do
    it 'is valid with valid attributes' do
      subject.title = "Some Title"
      subject.body = "Some Body"
      expect(subject).to be_valid
    end

    it 'is invalid when title is missing' do
      subject.body = "Some Body"
      expect(subject).to_not be_valid
    end

    it 'is invalid when body is missing' do
      subject.title = "Some Title"
      expect(subject).to_not be_valid
    end
  end

  describe 'trending articles' do
    it 'should return trending articles' do
      Article.create(title: 'Article One', body: 'Body One', search_count: 3)
      Article.create(title: 'Article Two', body: 'Body Two', search_count: 5)

      expect(Article.trending.first.title).to eq('Article Two')
      expect(Article.trending.last.title).to eq('Article One')
    end
  end
end