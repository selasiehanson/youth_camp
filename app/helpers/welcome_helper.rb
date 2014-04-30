module WelcomeHelper
  def is_active_page(incoming_page, what_page_is_this)
    incoming_page == what_page_is_this ? 'active' : ''
  end
end
