class CheatsheetsController < ApplicationController
  before_filter :authenticate! , :except => [:index]
  respond_to :html, :json

  def index
    if params[:tag].present?
      @cheatsheets = Cheatsheet.tagged_with(params[:tag])
    elsif params[:me]
      @cheatsheets = Cheatsheet.find(current_user.selected_cheatsheets.map(&:cheatsheet_id))
    else
      @cheatsheets = Cheatsheet.page(params[:page]).per(15)
    end
    @tags = Cheatsheet.all_tags
    respond_with(@cheatsheets)
  end


  def new
    @cheatsheet = Cheatsheet.new
  end

  def show
    @cheatsheet = Cheatsheet.find(params[:id])
    render :text => @cheatsheet.content
  end

  def create
    @cheatsheet = Cheatsheet.new(params[:cheatsheet])
    current_user.selected_cheatsheets.create(:cheatsheet_id => @cheatsheet.id)
    @cheatsheet.save
    respond_with(@cheatsheet, :location => cheatsheets_url)
  end

  def update
    @selected_cheatsheet = current_user.selected_cheatsheets.create(:cheatsheet_id => params[:id])
    respond_with(@selected_cheatsheet, :location => cheatsheets_url)
  end

  def destroy
    current_user.selected_cheatsheets.where(:cheatsheet_id => params[:id]).first.destroy
    respond_with(@selected_cheatsheet, :location => cheatsheet_url(current_user))
  end

end

