class RegistrationController < ApplicationController

  def index

  end

  def show

  end

  def create
    camper = CamperFormObject.to_camper(CamperFormObject.new(camper_params.to_h))
    if camper.save
      redirect_to camper
    else
      setup_view
      @errors = camper.errors
      @camper = CamperFormObject.from_camper(camper)
      render 'new'
    end
  end

  def new
    email = params[:email]
    phone_number = params[:phone_number]
    setup_view
    @camper = CamperFormObject.new({email: email, phone_number: phone_number})
    p @camper
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

  def sign_up
    if params[:camper][:phone_number].blank? || params[:camper][:email].blank?
      # flash message
      flash[:danger] = 'Both email and phone number are required'
      redirect_to root_url and return
    end
    phone_number = params[:camper][:phone_number]
    email = params[:camper][:email]
    camper =
    if Camper.find_by(email: email, phone_number: phone_number)
      # add errors
      flash[:danger] = 'A camper with the same credential already exists.
      If you are the one kindly login instead'
      redirect_to root_url and return
    elsif Camper.find_by(email: email)
      # add errors
      flash[:danger] = 'A camper with the same EMAIL already exists.
      If you are the one kindly login instead'
      redirect_to root_url and return
    elsif Camper.find_by(phone_number: phone_number)
      # add errors
      flash[:danger] = 'A camper with the same PHONE NUMBER already exists.
      If you are the one kindly login instead'
      redirect_to root_url and return
    else
      redirect_to "/registration/new?email=#{email}&phone_number=#{phone_number}"
    end
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
