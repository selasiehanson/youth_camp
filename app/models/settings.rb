module Settings

  REGISTRATION_END_DATE = "2019-06-18" 
 def Settings.registration_ended?
    Date.today > Date.parse(REGISTRATION_END_DATE)
  end
end
