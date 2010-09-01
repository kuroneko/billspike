class EntriesController < ApplicationController
  def index
    @entries = Entry.order('created_at desc')
  end
  
  def new
    @entry = Entry.new
  end
  
  def create
    @entry = Entry.new(params[:entry])
    if @entry.save then
      redirect_to @entry
    else
      render :action => 'new'
    end
  end
end
