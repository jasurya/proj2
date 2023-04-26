class User < ApplicationRecord
    

    mount_uploader :file_extension, ImageUploader
	validates_uniqueness_of :email  
end


