module Settings
  REGISTRATION_END_DATE = "2015-06-06"

  def Settings.registration_ended?
    Date.today > Date.parse(REGISTRATION_END_DATE)
  end
end
