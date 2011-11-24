class TempImage < ActiveRecord::Base

  belongs_to :user
  
  has_attached_file :image, 
    :styles => { :thumb  => "50x50",:small  => "100x100" },
    :url => "/system/logo/:id/:style/:basename.:extension",
    :path => ":rails_root/public/system/logo/:id/:style/:basename.:extension"
       
end
