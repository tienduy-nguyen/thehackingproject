# Ruby JSON, CSV, Google_drive

## Ruby JSON

- Installation 

  ```bash
  gem install json
  ```
- Parsing JSON using Ruby
  ```ruby
  require 'rubygems'
  require 'json'

  json = File.read('input.json')
  obj = JSON.parse(json)

  p obj
  ```
- Write JSON file
  ```ruby
  require 'json'
  tempHash = {
      "key_a" => "val_a",
      "key_b" => "val_b"
  }
  File.open("public/temp.json","w") do |f|
    f.write(tempHash.to_json)
  end
  ```
## Ruby CSV

[CSV rubyguide](https://www.rubyguides.com/2018/10/parse-csv-ruby/)

and [this guide](https://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html)

## Ruby Google_drive

Check out the official [gem google_drive](https://github.com/gimite/google-drive-ruby)