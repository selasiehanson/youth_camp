class WelcomeController < ApplicationController

  def index
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
end
