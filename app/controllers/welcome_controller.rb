class WelcomeController < ApplicationController

  def index
    @images = %w(1701,1702,1703)
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
