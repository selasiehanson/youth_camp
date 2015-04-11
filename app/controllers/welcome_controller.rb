class WelcomeController < ApplicationController

  def index
    @images = %w(1501 1502 1503)
    @page = 'index'    
  end

  def about
    @page = 'about'
  end

  def faq
    @page = 'faq'
  end

  def contact
    @page = 'contact'
  end

  def media
    @page = 'media'
  end
end
