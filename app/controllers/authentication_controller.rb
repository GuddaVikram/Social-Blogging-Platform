class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request
   
 def login
   command = AuthenticateUser.call(params[:email], params[:password])
    if command.success?
        user = User.find_by(email: params[:email])
        render json: { user: user,auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
 
 end
 
    def signup
      if User.new(username: params[:username], description: params[:description], email: params[:email], password: params[:password]).valid? == true
    render json: User.create(username: params[:username], description: params[:description], email: params[:email], password: params[:password])
      else
        render json: {"message": "please enter valid inputs"}
      end
    # puts params
    #   render json: User.create(username: params[:username], description: params[:description], email: params[:email], password: params[:password])
    #   # render json: params
  end


end
