require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup_1 = Startup.new("Startup 1", "Maya", "Domain 1")
startup_2 = Startup.new("Startup 2", "Orion", "Domain 2")
startup_3 = Startup.new("Startup 3", "Elle", "Domain 2")

jenna = VentureCapitalist.new("Jenna", 1500000000)
ben = VentureCapitalist.new("Ben", 3000000000)
kate = VentureCapitalist.new("Kate", 50000000)

startup_1.sign_contract(jenna, "Angel", 100000)
startup_2.sign_contract(ben, "Angel", 2000000)
startup_3.sign_contract(jenna, "Angel", 400000)
startup_1.sign_contract(kate, "Angel", 500000)
startup_1.sign_contract(ben, "Angel", 30000000)

jenna.offer_contract(startup_2, "Angel", 10000000)
kate.offer_contract(startup_3, "Angel", 8000000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
