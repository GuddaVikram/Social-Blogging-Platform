class FilterController < ApplicationController
    # "#{attr} ~* ?", search.to_s
    # "y LIKE ?", "%#{name}%"
    skip_before_action :authenticate_request
    def authorfilter
        # render json: Article.joins(:category).joins(:user).where(user:"username LIKE ?'%#{params[:username]}%'").select(:id,:title,:description,:text,:user_name,:category_name,:created_at )
       
        # render json: Article.joins(:category).joins(:user).where(user[:username].matches("%#{params[:username]}%")).select(:id,:title,:description,:text,:user_name,:category_name,:created_at )
        render json: Article.joins(:category).joins(:user).where("username LIKE ?","%#{params[:username]}%").select(:id,:title,:description,:text_content,:username,:category_name,:created_at )

    end
    def articlefilter
        render json: Article.joins(:category).joins(:user).where("title LIKE ?","%#{params[:title]}%").select(:id,:title,:description,:text,:username,:category_name,:created_at )
    end
    def categoryfilter
        render json: Article.joins(:category).joins(:user).where("category_name LIKE ?","%#{params[:category_name]}%").select(:id,:title,:description,:text,:username,:category_name,:created_at )
    end



end
