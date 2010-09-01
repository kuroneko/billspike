class DashboardController < ApplicationController
  def index
    @entries = Entry.order('created_at desc').limit(50)
    @accounts = @entries.map { |e| e.parties }.flatten.uniq
  end
end
