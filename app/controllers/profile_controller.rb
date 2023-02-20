class ProfileController < ApplicationController
    def getuserdetails
    article = Article.joins(:user).where(user:{id: params[:user_id]}).joins(:category).select("articles.*",:category_name)

        render json: { user: User.find_by(id: params[:user_id]) , article: article} 
    # render json: Article.joins(:user).where(user:{id: params[:user_id]} ).select(:id,:title,:description,:text_content,:category_name,:image_url,:user_id,:username,:email)
    end

    def edituser
        user = User.find_by(id: params[:user_id])
        render json: user.update(username: params[:username], email: params[:email], description: params[:description],image_url: params[:image_url])
        # render json: params
  
    end


end

