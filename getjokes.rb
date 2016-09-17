require 'rest-client'
require 'json'

res = RestClient.get "http://api.icndb.com/jokes/"
parse = JSON.parse(res)
hash = parse['value']

test = []
hash.each do |x|
  test << x['joke']
end

File.open("jokes.txt", "w") do |f|
  test.each do |x|
    f << "#{x}\n"
  end
end

