require 'helper'

class TestCsv2json < Test::Unit::TestCase
    SEPS = {:comma => ',', :pipe => '|', :semicolon => ';'}

    should "parse some test files" do
        fixtures_dir = File.expand_path(File.join(File.dirname(__FILE__), 'fixtures'))

        Dir.chdir(fixtures_dir) do
            Dir.glob('*.csv') do |filename|
                filename_parts = File.basename(filename, ".csv").split('_')
                json_template = filename_parts[0] + '.json'

                print "Testing #{filename}\n"

                File.open(filename, "r") do |input|
                    output = StringIO.new()
                    CSV2JSON.parse(input, output, nil, {:col_sep => SEPS[filename_parts[1].to_sym]}, {:pretty => true} )
                    template = File.read(json_template)

                    output.pos = 0
                    assert "Content doesn't match", template == output.read
                end
            end
        end
    end
end
