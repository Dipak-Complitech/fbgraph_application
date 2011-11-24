class Photo < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :image, 
       :styles => { :thumb  => "50x50",:small  => "100x100" },
       :url => "/system/fb_image/:id/:style/:basename.:extension",
       :path => ":rails_root/public/system/fb_image/:id/:style/:basename.:extension"
  
  attr_accessor :album_name, :desc   

end
