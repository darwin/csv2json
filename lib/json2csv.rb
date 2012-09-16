require 'rubygems'
require 'fastercsv'
require 'json'
require File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib', 'csv2json-version.rb')

module JSON2CSV

    def parse(input, output, headers=nil, csvOptions=nil)
        json = JSON.parse(input)

        unless headers
            headers = json[0].keys
        end

        outputCSV = FasterCSV.generate(csvOptions) do |csv|
            csv << headers

            json.each do |obj|
                sortedValues = Array.new(headers.length)

                obj.each do |key, val|
                    headers.each_index { |i|
                        sortedValues[i] = val if headers[i] == key
                    }
                end

                csv << sortedValues
            end
        end
        
        output << outputCSV
    end

    module_function :parse
    
end
