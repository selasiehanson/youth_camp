class RegistrationController < ApplicationController

  def index

  end

  def show   
  end

   def new    
    setup_view
    if @form_object.nil?
      @camper = @form_object
    else
      @camper = CamperFormObject.new({email: "", phone_number: ""})
    end
  end


  def create
    @form_object = CamperFormObject.new(camper_params.to_h)
    camper = CamperFormObject.to_camper(@form_object)
    status = camper_exists(camper)
    if status[0] == true
      flash[:danger] = status[1]
      # setup_view
      # @camper = CamperFormObject.from_camper(camper)
      render action: 'new'
    end
    if camper.save
      sign_in camper
      redirect_to camper_url
    else
      setup_view
      @errors = camper.errors
      render 'new'
    end
  end

 
  def setup_view
    @countries = Country::LIST.collect {|p| [ p[:printable_name], p[:name] ] }
    @schools = School::LIST.collect {|p| [ p[:name], p[:name] ] }
    @locations = Lookup::SCHOOL_LOCATIONS.collect {|p| [ p[:name], p[:name] ] }
    @educational_levels = Lookup::EDUCATIONAL_LEVELS.collect {|p| [ p[:name], p[:name] ] }
    @roles = Lookup::ROLES.collect {|p| [ p[:name], p[:name] ] }
    @arrival_days = Lookup::ARRIVAL_DAYS.collect {|p| [ p[:name], p[:name] ] }
    @arrival_times = Lookup::ARRIVAL_TIMES.collect {|p| [ p[:name], p[:name] ] }
    @churches = Lookup::CHURCHES.collect {|p| [ p[:name], p[:name] ] }
  end

  def edit

  end

  def show
  end

  def update
  end

  def camper_exists(camper)
    email = camper.email
    phone_number = camper.phone_number
    status = [false, ""]

    if Camper.find_by(email: email, phone_number: phone_number)
      message = 'A camper with the same credential already exists.
      If you are the one kindly login instead'      
      status=[true, message]
    elsif Camper.find_by(email: email)
      message = 'A camper with the same EMAIL already exists.
      If you are the one kindly login instead'
      status=[true, message]
    elsif Camper.find_by(phone_number: phone_number)      
      message = 'A camper with the same PHONE NUMBER already exists.
      If you are the one kindly login instead'
      status=[true, message]
    end
    status
  end

  def camper_params
    params.require(:camper).permit(:first_name,  :last_name,  :other_names,
    :gender, :date_of_birth,  :email,  :nationality,
    :arrival_day,  :arrival_time,
    :phone_number,  :residence,  :role,
    :emergency_contact, :emergency_number,
    :church, :other_church,
    :occupation, :school,  :school_location, :educational_level, :other_school)
  end
end
