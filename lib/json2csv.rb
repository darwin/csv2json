require 'rubygems'
require 'fastercsv'
require 'json'
require 'csv2json-version.rb'

module JSON2CSV

    # convert an input string value to integer or float if applicable
    def convert(val)
        return Integer(val) if val.to_i.to_s == val
        Float(val) rescue val
    end


    def parse(input, output, headers=nil, options={})
        inputJSON = JSON.parse(input)

        outputCSV = FasterCSV.generate do |csv|
            csv << inputJSON[0].keys
            inputJSON.each do |row|
                csv << row.values
            end
        end
        
        output << outputCSV
    end

    
    module_function :parse
    module_function :convert
    
end
