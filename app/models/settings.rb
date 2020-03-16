module Settings

  REGISTRATION_END_DATE = "2020-06-21" 
 def Settings.registration_ended?
    Date.today > Date.parse(REGISTRATION_END_DATE)
  end
end
