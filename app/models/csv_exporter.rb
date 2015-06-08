require 'csv'
class CSVExporter

  class << self
    def get_hashed_attributes_as_csv(data, columns)
      p columns
      data.inject([]) do |o, d|
        o << columns.inject([]) do |res, col|
          res << d[col] || ''
        end
      end
    end

    def run(data, columns=[])
      type = data[0].class
      CSV.generate do |csv|
        if type == Hash
          columns = data[0].keys
          csv << columns
          get_hashed_attributes_as_csv(data, columns).each do |line|
            csv << line
          end
        else
          #we assume we are dealing with object created from a class
          csv << columns
          cols = columns.map(&:to_s)
          data.each do |d|
            csv << d.attributes.values_at(*cols)
          end
        end
        csv
      end
    end 
  end
end
