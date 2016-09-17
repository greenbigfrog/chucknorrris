
require 'dotenv'
Dotenv.load('.env')

# Load file
jokes = File.readlines('jokes.txt')

require 'discordrb'
bot = Discordrb::Commands::CommandBot.new token: ENV['TOKEN'], application_id: ENV['APPID'], prefix: ';', advanced_functionality: false, debug: true #, log_mode: :debug

bot.command(:invite, description: 'Add the bot to your server') do |event|
  "You can add this bot to your server. #{bot.invite_url}"
end

bot.command(:stats, description: 'shows a few stats about the bot') do |event|
  members = 0
  event.bot.servers.each { |x, y| members = members + y.member_count }
  "Currently I'm on **#{event.bot.servers.size} servers** with a total user count of **#{members} users** in **#{event.bot.servers.collect { |x, y| y.channels.size }.inject(0, &:+)} channels**!"
end

bot.command([:joke, :chuck, :cn, :norris], description: 'displays a random joke from the icndb', usage: ';joke') do |event|
  "#{jokes.sample.gsub('&quot;', '_')}"
end

bot.run