class Cheatsheet
  include Mongoid::Document
  include Mongoid::Document::Taggable

  mount_uploader :image, ImageUploader

  field :name, :type => String
  field :cheatsheet_type , :type => String
  field :visible, :type => Boolean

  has_many :selected_cheatsheets

end

