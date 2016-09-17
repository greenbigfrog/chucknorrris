
require 'dotenv'
Dotenv.load('.env')

# Load file
jokes = File.readlines('jokes.txt')

require 'discordrb'
bot = Discordrb::Commands::CommandBot.new token: ENV['TOKEN'], application_id: ENV['APPID'], prefix: ';', advanced_functionality: false, debug: true #, log_mode: :debug

bot.command([:joke, :chuck, :cn, :norris], description: 'displays a random joke from the icndb', usage: ';joke') do |event|
  "#{jokes.sample.gsub('&quot;', '_')}"
end

bot.run