class EntriesController < ApplicationController
  def index
    @entries = Entry.order('created_at desc')
  end
  
  def problems
    #FIXME: this doesn't scale.
    @entries = Entry.select { |e| e.balance != 0 }
    render :action => 'index'
  end
  
  def new
    @entry = Entry.new
    # build two LE's to start with.
    @entry.ledger_entries.build
    @entry.ledger_entries.build
  end
  
  def create
    @entry = Entry.new(params[:entry])
    if params[:add] then
      @entry.ledger_entries.build
      render :action => 'new'
    else
      if @entry.save then
        redirect_to @entry, :notice => "Successfully created entry"
      else
        render :action => 'new'
      end
    end
  end
  
  def show
    @entry = Entry.find(params[:id])
  end
  
  def edit
    @entry = Entry.find(params[:id])
  end
  
  def update
    @entry = Entry.find(params[:id])
    if params[:add] then
      @entry.ledger_entries.build
      render :action => 'edit'
    else
      if @entry.update_attributes(params[:entry])
        redirect_to @entry, :notice => 'Entry was successfully updated'
      else
        render :action => 'edit'
      end
    end
  end
  
  def destroy
    @entry = Entry.find(params[:id])
    if @entry.destroy then
      redirect_to entries_url, :notice => "Successfully deleted entry"
    else
      redirect_to entries_url, :alert => "Couldn't delete entry"
    end
  end
end
