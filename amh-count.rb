require 'bundler/setup'

require 'yaml'
require 'highline'
require 'gmail'

hl = HighLine.new

begin 
  config = YAML.load_file('.amhrc')
rescue
  config = {}
end

config['user'] ||= hl.ask("Username? ")
config['pass'] ||= hl.ask("Password? "){ |q| q.echo = false }

Gmail.new(config['user'], config['pass']) do |gmail|
  puts gmail.inbox.count
end
