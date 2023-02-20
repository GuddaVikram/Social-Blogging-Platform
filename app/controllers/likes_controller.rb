class LikesController < ApplicationController
    def post
    # increase the count of article id
     
    # add in like table
        article =  Article.find_by(id: params[:article_id])
        t = article.likes_count.to_i
        t=t+1
        article.update(likes_count: t)
        
        render json: Like.create(article_id: params[:article_id], user_id: params[:user_id] )
        


    end

end
