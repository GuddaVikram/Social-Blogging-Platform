class ArticleallController < ApplicationController
    skip_before_action :authenticate_request
    def getarticles
        render json: Article.joins(:category).joins(:user).select(:id,:title,:description,:image_url,:username,:category_name,:created_at,:user_id)
    
     end
    
end
