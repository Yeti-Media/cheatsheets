class ViewerController < ApplicationController
  before_filter :authenticate!



  def show
    @cheatsheets = Cheatsheet.find(current_user.selected_cheatsheets.map(&:cheatsheet_id))
  end
end

