class TempImagesController < ApplicationController

  def index
      @user = User.last
      @temp = TempImage.find(:all,:conditions=>["user_id= ?",@user.id])
      render  :partial => '/users/temp_files',:object => @temp,:layout=>false
  end
  
  def create
   newparams = coerce(params)
   temp = TempImage.create(newparams[:temp_photo])
    if temp.valid?
       render :xml => '<response msg="success"><temp_file id="' + temp.id.to_s + '"/></response>' 
    else
       render :xml => 'error',:status => :unprocessable_entity
     end
  end
  
  private
  
  def coerce(params)
    if params[:photo].nil?
      logger.warn(" corse if")
      h = Hash.new
      h[:temp_photo] = Hash.new
      h[:temp_photo][:image] = params[:Filedata]
      h[:temp_photo][:user_id] = params[:user_id]
      h
    else
      logger.warn(" corse else")
      params
    end
  end
  
  
end