class Member < ActiveRecord::Base
  validates_presence_of :name
  before_save :capitalize_job

  has_attached_file :member_image,
    :url=>"/file_upload/member_image/:filename", 
    :default_url => "/favicon.ico",
    :path => ":rails_root/public/file_upload/member_image/:filename"
    #:styles => {default: "300x300>", small: "100x100>" }                         
  validates_attachment :member_image,                      
    :content_type => { :content_type => /\Aimage\/.*\Z/ },
    :size => { :less_than => 2.megabytes }

  private
  def capitalize_job
      self.job.capitalize!
  end

end
