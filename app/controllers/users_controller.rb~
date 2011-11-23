require 'fb_graph'
class UsersController < ApplicationController

  def index
  end
  
  def fbgraph_connection
    fb_auth = FbGraph::Auth.new('110224169092831','920b0e997777359f0e92e299f7c8c797')
    client = fb_auth.client
    client.redirect_uri = "http://localhost:3000/users/new"
    redirect_to client.authorization_uri(:scope => [:email, :read_stream, :offline_access, :user_about_me,:user_activities,:user_birthday,:user_education_history,:user_events,:user_groups,:user_hometown,:user_interests,:user_likes,:user_location,:user_notes,:user_online_presence,:user_photo_video_tags,:user_photos,:user_relationships,:user_relationship_details,:user_religion_politics,:user_status,:user_videos,:user_website,:user_work_history,:email,:read_friendlists,:read_insights,:read_mailbox,:read_requests,:read_stream,:xmpp_login,:ads_management,:user_checkins,:publish_stream,:create_event,:rsvp_event,:sms,:offline_access,:publish_checkins,:manage_pages,:friends_about_me,:friends_activities,:friends_birthday,:friends_education_history,:friends_events,:friends_groups,:friends_hometown,:friends_interests,:friends_likes,:friends_location,:friends_notes,:friends_online_presence,:friends_photos,:friends_relationships,:friends_relationship_details,:friends_religion_politics,:friends_status])

  end

  def new
    if params[:access_token]
     @access_token = params[:access_token]
     fb_user = FbGraph::User.me(@access_token).fetch
     fb_user_name = fb_user.name
    else
     fb_auth = FbGraph::Auth.new('110224169092831','920b0e997777359f0e92e299f7c8c797')
     client = fb_auth.client
     client.redirect_uri = "http://localhost:3000/users/new"
     client.authorization_code = params[:code]
     @access_token = client.access_token!
     fb_user = FbGraph::User.me(@access_token).fetch
     @user = User.create(:fb_id => fb_user.identifier)
   end
  end
  
  def fblink
     if request.get?
     @user = User.new(params[:user])
     @access_token = params[:access_token]
     else 
     @user = User.new(params[:user])
     access = params[:access_token]
       me = FbGraph::User.me(access)
       link = me.link!(
        :link => @user.link,
        :message => @user.status
       )
       flash[:notice] = "Link Post Successfully"
       redirect_to("/users/new?access_token=#{access}", :notice => 'Link Post Successfully.')
    end       
  end
  
  def fbstatus
     if request.get?
     @user = User.new(params[:user])
     @access_token = params[:access_token]
     else 
     @user = User.new(params[:user])
     access = params[:access_token]
       me = FbGraph::User.me(access)
       me.feed!(
        :message => @user.status,
        :link => 'https://github.com/nov/fb_graph',
        :name => 'FbGraph',
        :description => 'A Ruby wrapper for Facebook Graph API'
       )
       flash[:notice] = "post status Successfully"
       redirect_to "/users/new?access_token=#{access}"
    end       
  end
  
  def fbcreatealbum
    if request.get?
     @user = User.new(params[:user])
     @access_token = params[:access_token]
     else 
     @user = User.new(params[:user])
     access = params[:access_token]
       me = FbGraph::User.me(access)
       album = me.album!(
        :name => @user.name,
        :message => 'album'
       ) 

       flash[:notice] = "album created Successfully"
       redirect_to "/users/new?access_token=#{access}"
    end   
  end
 
  def fbuploadimage
  
     if request.get?
      @photo = Photo.new(params[:photo])
      @access_token = params[:access_token]
     else 
       @photo = Photo.new(params[:photo])
       if @photo.save
      access = params[:access_token]
       me = FbGraph::User.me(access)
       album = me.albums.first
       album.photo!(
        :access_token => access,
        :source => File.new(@photo.image.path, 'rb')
       )
       flash[:notice] = "Image Post Successfully"
       redirect_to("/users/new?access_token=#{access}")

   #    redirect_to "/users/new?access_token=#{access}"
       
     end 
    end   
  end

end
