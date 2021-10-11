class AuthenticationController < ApplicationController
 skip_before_action :authenticate_request

 def authenticate
   command = auth_user(params[:email], params[:password])
byebug
   if command
     render json: { auth_token: command }
   else
     render json: { error: command.errors }, status: :unauthorized
   end
 end

 private
  def auth_user(email,pwd)
  	user = User.find_by_email(email)
  	if user && user.authenticate(pwd)
  		JsonWebToken.encode(user_id: user.id)
  	else
  		nil
  	end
  end
end