require 'rails_helper'

RSpec.describe ArticlesController, type: :request do
  describe 'GET #index' do
    before do
      Article.create(title: 'Implement Search', body: 'test article')
    end

    it 'returns http success' do
      get articles_path
      expect(response).to have_http_status(:success)
    end

    it 'should return searched article' do
      get "/articles.json?query=Implement"

      expect(JSON.parse(response.body)['data'].size).to eq(1)
    end

    it 'should not return searched article with invalid search query' do
      get "/articles.json?query=What"

      expect(JSON.parse(response.body)['data'].size).to eq(0)
    end
  end
end
