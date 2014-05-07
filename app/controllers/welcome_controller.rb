class WelcomeController < ApplicationController

  def index
    @page = 'index'
    @camper = Camper.new    
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
end
