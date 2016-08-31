class Image < ActiveRecord::Base
    has_attached_file :dartboard
    validates_attachment_content_type :dartboard, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
