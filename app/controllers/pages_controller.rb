class PagesController < ApplicationController

  # we call methods in controllers `actions`
  def index
    # by default (convetion) this method will attempt to render
    # a file inside app/views/pages 
    # that has the same method name `index`
    # and by default it will use extension `.html.erb`
  end
end
