class Api::CampersController < ApplicationController

  EXPORT_PATH = "#{Rails.root}/public/exports/"

  def index
    render json: Camper.all
  end

  def show
    render json: Camper.find(params[:id])
  end

 def export
  unless (Dir.exists?(EXPORT_PATH))
    Dir.mkdir(EXPORT_PATH)
  end

  file_name = Time.now.to_formatted_s(:number)
  data = Camper.all.to_a 
  
  processed_data = data.map do |d|
    hash = Hash[d.attributes]
    p hash
    #transform these fields into single vlaues instead
    hash['church'] = hash['church']['name']
    hash['occupation'] = hash['occupation']['type']
    #take out the ff fields
    hash.delete('is_admin')
    hash.delete('confirm_email')
    hash.delete('confirm_phone_number')
    hash.delete('_id')
    hash
  end

  csv_data = CSVExporter.run(processed_data)

  File.open("#{EXPORT_PATH}/#{file_name}.csv", 'wb') do |f|
    f << csv_data
  end
  render json: {success: true, file_name: file_name}    
 end 

 def download_csv
  down_it(params['file_name'], 'csv');
 end

def down_it(name, format)
    send_file "#{EXPORT_PATH }#{name}.#{format}", :type => "text/#{format}; charset=iso-8859-1; header=present"
  end
end
