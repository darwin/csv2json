# csv2json

Clients were sending me XLS files, but my webs consume JSON. So I needed to convert them to JSON easily from command-line. 
Tried to google for solution and surprisingly enough nothing solid existed.

## Solution

- export XLS as a CSV file (I use OpenOffice.org for this)
- run `csv2json file.csv > file.json` (or `json2csv file.json > file.csv`)
- there is no step 3

### Sample

note: make sure your XLS table has the first row with column names, or use the -H option to provide some

This CSV file:

    thumbpath,imgpath,imgsrc,width,height,thumbsrc,thumbwidth,thumbheight
    thumbnails/,images/,paris_01.jpg,350,262,paris_01.jpg,75,56
    thumbnails/,images/,paris_02.jpg,262,350,paris_02.jpg,75,56
    
gets turned into this JSON: 

    [
      {
        "thumbwidth": 75,
        "imgsrc": "paris_01.jpg",
        "thumbsrc": "paris_01.jpg",
        "height": 262,
        "imgpath": "images/",
        "thumbheight": 56,
        "thumbpath": "thumbnails/",
        "width": 350
      },
      {
        "thumbwidth": 75,
        "imgsrc": "paris_02.jpg",
        "thumbsrc": "paris_02.jpg",
        "height": 350,
        "imgpath": "images/",
        "thumbheight": 56,
        "thumbpath": "thumbnails/",
        "width": 262
      }
    ]

### Installation

`sudo gem install csv2json --source http://rubygems.org`

### Usage

Usage: csv2json [INPUT] [OPTIONS]

    Specific options:
        -s, --separator SEP              Set separator character surrounded by single quotes (default is ',')
        -o, --output FILE                Write output to a file
        -p, --pretty                     Pretty-format JSON output
        -k, --skip-headers-from-file     Ignore the headers (first line) in the file; use with --headers to set your own
        -H, --headers HEADERS            Supply list of headers, where no headers exist in the file, or where you're using -k to ignore them
        -h, --help                       Show this message
        -v, --version                    Show version

We also provide `json2csv`, which converts in the opposite direction.

    Usage: json2csv [INPUT] [OPTIONS]

    Specific options:
        -s, --separator SEP              Set separator character surrounded by single quotes (default is ',')
        -o, --output FILE                Write output to a file
        -H, --headers HEADERS            Supply sorted list of headers, by which to order the columns in the CSV. These must match the key names in the JSON.
        -h, --help                       Show this message
        -v, --version                    Show version


Note: JSON field order is explicitly unsorted, so if you want predictable field order for CSV output, use the -H option.

### Alternative usage

common usage is `csv2json file.csv > file.json`

csv2json should behave like proper unix command-line utility working with pipes, redirects, etc.

`cat file.csv | csv2json | gzip > file.json.gz`

### Usage as a library

with files

    require 'csv2json'

    File.open('input.csv', 'r') do |input|
        File.open('output.json', 'w') do |output|
            CSV2JSON.parse(input, output)
        end
    end

or in-memory

    require 'csv2json'

    input = StringIO.new(csv_string)
    output = StringIO.new()
    CSV2JSON.parse(input, output)
    
    output.pos = 0
    puts output.read

## Authors

* **Antonin Hildebrand** ([http://binaryage.com](http://binaryage.com))
* **Rafael Souza** ([http://github.com/rafaels](http://github.com/rafaels))

---

## Want to contribute?

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.