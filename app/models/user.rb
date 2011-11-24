class User < ActiveRecord::Base
  has_many :photos
  has_many :temp_images
  attr_accessor :link,:status
   
end
