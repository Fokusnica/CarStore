class Gallery < ActiveRecord::Base

  belongs_to :product


  include Paperclip::Glue
  has_attached_file :photo, :styles => { :medium => "255x237>", :thumb => "100x100>" }, :default_url => "missing.png"
  validates_attachment :photo, content_type: { content_type:     ["image/jpg", "image/jpeg", "image/png"] }
end
