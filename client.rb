require 'net/http'
require 'json'

begin

prices = {
  orange: 100,
  apple: 200,
  peach: 400
}
http = Net::HTTP.new('localhost', '3000')

loop do
  items = [
    { name: :orange, count: rand(10) },
    { name: :apple,  count: rand(10) },
    { name: :peach,  count: rand(10) }
  ]
  right_answer = items.sum do |item|
    prices[item[:name]] * item[:count]
  end

  req = Net::HTTP::Post.new('/calc/index')
  req.body = { items: items }.to_json
  res = http.request(req)
  
  print res.body.to_i == right_answer ? "\e[32m" : "\e[31m"
  print "■\e[0m"
end

rescue Interrupt
  puts 'good bye'
end
