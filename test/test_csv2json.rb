require 'helper'
require File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib', 'csv2json.rb') # this form is important for local development

class TestCsv2json < Test::Unit::TestCase
    should "parse some test files" do
        fixtures_dir = File.expand_path(File.join(File.dirname(__FILE__), 'fixtures'))
        Dir.chdir(fixtures_dir) do
            Dir.glob('*.csv') do |filename|
                json_template = File.basename(filename, ".csv")+'.json'
                print json_template
                File.open(filename, "r") do |input|
                    output = StringIO.new()
                    CSV2JSON.parse(input, output)
                    template = File.read(json_template)
                    output.pos = 0
                    assert template == output.read
                end
            end
        end
    end
end
