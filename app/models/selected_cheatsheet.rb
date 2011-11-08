class SelectedCheatsheet
  include Mongoid::Document

  belongs_to :user
  belongs_to :cheatsheet
end

