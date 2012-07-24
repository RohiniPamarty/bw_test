class SessionsController < ApplicationController
  def new
  end

  def create
  auth_hash =request.env['omniauth.auth']
 
  

  @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
  if @authorization
    

   redirect_to posts_url(:token => @authorization.token)
  else
    user = User.new(:name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"])
   #user= User.find_by_name(auth_hash["info"]["name"])
    user.build_authorization({ :provider => auth_hash["provider"], :uid => auth_hash["uid"], :token =>(auth_hash['credentials']['token'] rescue nil)})
    user.save  
    redirect_to posts_url(:token => @authorization.token)
    
  end
  end

  def failure
render :text=> "sorry u r not allowed to ur app"
  end

def destroy
session[:user_id]=nil
render :text => "u r logged out"
end
end
