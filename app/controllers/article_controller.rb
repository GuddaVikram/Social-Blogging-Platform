class ArticleController < ApplicationController
skip_before_action :authenticate_request
 def createarticle
    category = Category.find_by(category_name: params[:category_name])
    if category.present?
      article = Article.new(title: params[:title], description: params[:description], text_content: params[:text_content],image_url: params[:image_url],user_id: params[:user_id], category_id: category.id)
      if article.valid?
         article.save
         render json: article
      else
         render json:{"message": "enter all valid inputs"}
      end
      #   render json: Article.create(title: params[:title], description: params[:description], text_content: params[:text_content],image_url: params[:image_url],user_id: params[:user_id], category_id: category.id)
    else
        newcategory = Category.create(category_name: params[:category_name])
        render json: Article.create(title: params[:title], description: params[:description], text_content: params[:text_content],image_url: params[:image_url],user_id: params[:user_id], category_id: newcategory.id)
    end
 end


 def getarticlebyuserid
  
    render json: Article.joins(:user).where(user_id: params[:user_id])
 end 
 def getarticlebyarticleid
    # render json: Article.find(params[:article_id])
   render json: Article.joins(:category).joins(:user).where(id: params[:article_id]).select(:id,:title,:description,:image_url,:username,:category_name,:created_at,:text_content,:user_id,:likes_count)
    
 end
 def editarticle
    article = Article.find_by(id: params[:id])
    render json: article.update(title: params[:title], description: params[:description], text_content: params[:text_content],image_url: params[:image_url])
   #  render json: article.update(params.require(:article).permit(:title,:description,:text_content,:image_url))
 end

 
 def deletearticle
    article = Article.find_by(id: params[:id])
    render json: article.destroy   
 end





end
