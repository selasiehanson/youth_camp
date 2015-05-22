class WelcomeController < ApplicationController

  def index
    @images = %w(1501 1502 1503 1504)
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

  def donate
    @page='donate'
  end
  def media
    @page = 'media'
  end
end
