# frozen_string_literal: true

require 'optparse'

require_relative '../lib/file_parser'
require_relative '../lib/unique_views_counter'
require_relative '../lib/page_visits_counter'
require_relative '../lib/file_not_found'

options = {}

# By default count page visits
options[:count_type] = PageVisitsCounter.new

option_parser = OptionParser.new do |opts|
  opts.banner = 'Usage: ruby bin/parser.rb webserver.log --count_type [number_page_visits/page_unique_views]'

  opts.on('-ct', '--count_type COUNT_TYPE', %i[number_page_visits page_unique_views]) do |count_type|
    options[:count_type] = PageVisitsCounter.new if count_type == :number_page_visits
    options[:count_type] = UniqueViewsCounter.new if count_type == :page_unique_views
  end
  opts.on('-h', '--help', 'Prints this help') do
    puts opts
    exit
  end
end

# parse! theis will remove the switches destructivly ie you just have the file webserver.log
option_parser.parse!
file_name = ARGV[0]
counts = options[:count_type]

begin
  FileParser.new.parse(file_name, counts)

  puts options[:count_type].print_result
rescue FileNotFound => e
  puts e
end
