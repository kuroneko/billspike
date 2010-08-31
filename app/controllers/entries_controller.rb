class EntriesController < ApplicationController
  def index
    @entries = Entry.order('created_at desc').limit(50)
  end
end
