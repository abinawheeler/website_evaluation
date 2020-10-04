#Ruby class for command-line option analysis
require 'optparse'

require_relative '../lib/file_parser'
require_relative '../lib/unique_views_counter'
require_relative '../lib/page_visits_counter'
require_relative '../lib/file_not_found'



class Parser

  def self.parse(args)
    
    # This hash will hold all of the options
    # parsed from the command-line by
    # OptionParser.
    options = {}

    opt_parser = OptionParser.new do |opts|
      
      opts.banner = "Usage: ruby bin/parser.rb webserver.log --count_type [number_page_visits/page_unique_views]"

      opts.on('-ct', '--count_type COUNT_TYPE', %i[number_page_visits page_unique_views]) do |count_type|

        if count_type == :number_page_visits
          options[:count_type] = PageVisitsCounter.new 
          
        
        elsif count_type == :page_unique_views
          options[:count_type] = UniqueViewsCounter.new 
        end
      end
        
      opts.on("-h", "--help", "Prints this help") do
        puts opts
        exit
      end    

    end
    
    
    begin
      opt_parser.parse!(options)
      return options
    rescue StandardError => e
      # Only the app's exceptions are swallowed. Things like SyntaxErrror are left alone. 
      puts "Exception encountered: #{e}"
      exit 1
    end
    
  end

end



begin
  options = Parser.parse(ARGV)
  file_name = ARGV[0]
  file_parser = FileParser.new
  file_parser.parse(file_name,  options[:count_type]) 
  
  puts options[:count_type].print_result
rescue FileNotFound => e
  puts e
end
  



