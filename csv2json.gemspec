# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "csv2json"
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Antonin Hildebrand", "Rafael Souza"]
  s.date = "2014-03-19"
  s.description = "handy for converting xls files to json"
  s.email = "antonin@hildebrand.cz"
  s.executables = ["csv2json", "json2csv"]
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    ".document",
    "LICENSE",
    "README.md",
    "Rakefile",
    "bin/csv2json",
    "bin/json2csv",
    "csv2json.gemspec",
    "lib/csv2json-version.rb",
    "lib/csv2json.rb",
    "lib/json2csv.rb",
    "test/fixtures/addresses.json",
    "test/fixtures/addresses_comma.csv",
    "test/fixtures/addresses_pipe.csv",
    "test/fixtures/addresses_semicolon.csv",
    "test/fixtures/photos.json",
    "test/fixtures/photos_comma.csv",
    "test/fixtures/photos_pipe.csv",
    "test/fixtures/photos_semicolon.csv",
    "test/fixtures/population.json",
    "test/fixtures/population_comma.csv",
    "test/fixtures/population_pipe.csv",
    "test/fixtures/population_semicolon.csv",
    "test/helper.rb",
    "test/json2csv-fixtures/photos.json",
    "test/json2csv-fixtures/photos_comma.csv",
    "test/json2csv-fixtures/photos_pipe.csv",
    "test/json2csv-fixtures/photos_semicolon.csv",
    "test/test_csv2json.rb",
    "test/test_json2csv.rb"
  ]
  s.homepage = "http://github.com/darwin/csv2json"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = ".csv to .json converter"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<test-unit>, ["1.2.3"])
    else
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<test-unit>, ["1.2.3"])
    end
  else
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<test-unit>, ["1.2.3"])
  end
end

