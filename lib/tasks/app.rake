namespace :app do
  task :set_admin,  [:email] => [:environment] do |t, args|
    puts "u entered #{args[:email]}"
    email = args[:email]
    camper =  Camper.find_by(email: email)
    if camper
      camper.is_admin = true
      if camper.save
        puts "#{camper.first_name} #{camper.last_name} set as Admin"
      else
        puts "Couldn't set user with #{email} as admin"
      end
    end
  end
end
