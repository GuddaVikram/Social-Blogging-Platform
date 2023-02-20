class CategoryController < ApplicationController
    skip_before_action :authenticate_request
    def get
        render json: Category.all
    end

end
