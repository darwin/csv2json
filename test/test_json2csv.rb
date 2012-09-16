require 'helper'
require File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib', 'csv2json.rb') # this form is important for local development

class TestJson2Csv < Test::Unit::TestCase
    SEPS = {:comma => ',', :pipe => '|', :semicolon => ';'}

    should "parse some test files" do
        fixtures_dir = File.expand_path(File.join(File.dirname(__FILE__), 'fixtures'))
        Dir.chdir(fixtures_dir) do
            Dir.glob('*.json') do |filename|
                filename = File.basename(filename, ".json")

                SEPS.each do |sep|
                    input = File.read(filename)
                    output = StringIO.new()
                    JSON2CSV.parse(input, output, nil, {:col_sep => sep.to_sym} )
                    output.pos = 0

                    fileToCompareTo = File.read("#{filename}_#{sep}.csv")
                    assert output.read == fileToCompareTo
                end
            end
        end
    end
end
