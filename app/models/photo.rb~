class Photo < ActiveRecord::Base
   
 has_attached_file :image, :styles => { :thumb  => "50x50",
                                         :small  => "100x100",
                                         :medium => "200x200",
                                         :large  => "300x300"   },
       :url => "/system/logo/:id/:style/:basename.:extension",
       :path => ":rails_root/public/system/logo/:id/:style/:basename.:extension"
  
  
  validates_attachment_presence :image
end
