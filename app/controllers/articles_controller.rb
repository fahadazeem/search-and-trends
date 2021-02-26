class ArticlesController < ApplicationController

  def index
    @articles = Article.search_by_title(params.dig(:query))

    respond_to do |format|
      format.html do
        update_analytics
        load_trends
      end
      format.json { render json: {data: @articles} }
    end
  end

  private

  def load_trends
    @trending = Article.trending.pluck(:title)
  end

  def update_analytics
    @articles.each do |article|
      article.update_attribute(:search_count, article.search_count + 1)
    end
  end
end
