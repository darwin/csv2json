require 'helper'

class TestJson2Csv < Test::Unit::TestCase
    SEPS = {:comma => ',', :pipe => '|', :semicolon => ';'}

    should "parse some test files" do
        fixtures_dir = File.expand_path(File.join(File.dirname(__FILE__), 'json2csv-fixtures'))

        Dir.chdir(fixtures_dir) do
            Dir.glob('*.json') do |filename|
                basename = File.basename(filename, ".json")

                print "Testing json2csv against #{filename}\n"

                SEPS.each do |key, val|
                    template = "#{basename}_#{key.to_sym}.csv"
                    print "   ... for comparison with #{template} "
                    headers = ['thumbpath','imgpath','imgsrc','width','height','thumbsrc','thumbwidth','thumbheight']

                    input = File.read(filename)
                    output = StringIO.new()
                    JSON2CSV.parse(input, output, headers, {:col_sep => val} )

                    output.pos = 0
                    fileToCompareTo = File.read(template)
                    assert_equal output.read.strip, fileToCompareTo.strip
                    print "OK\n"
                end
            end
        end
    end
end
