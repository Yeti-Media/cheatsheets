class Cheatsheet
  include Mongoid::Document
  include Mongoid::Document::Taggable

  CHEATSHEET_TYPES = %w(content image url)

  mount_uploader :image, ImageUploader

  field :name, :type => String
  field :cheatsheet_type , :type => String
  field :visible, :type => Boolean
  field :content , :type => String
  field :url , :type => String

  has_many :selected_cheatsheets


  def as_json(*args)
    {:id => id ,
     :image => image ,
     :cheatsheet_type => cheatsheet_type,
     :name => name
     }
  end
end

