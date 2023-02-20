class CommentController < ApplicationController
    def post
    render json: Comment.create(comment_text: params[:comment_text], user_id: params[:user_id], article_id: params[:article_id])
    end
    def getcommentbyarticleid
    
   render json: Comment.joins(:article).where(article:{id: params[:article_id]})
    end
end
