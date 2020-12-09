# frozen_string_literal: true

require_relative 'line_dissection'
require_relative 'page_visits_counter'
require_relative 'unique_views_counter'
require_relative 'file_not_found'

# Opens webserver.log file to get log entries and call the dissection class
class FileParser
  def parse(file_name, option)
    check_file_name(file_name)
    # use File.foreach to read file line by line. File.read would read the whole file
    # into memory at once
    File.foreach(file_name) do |line|
      dissected_line = LineDissection.new(line.chomp)
      option.add_to_count(dissected_line)
    end
  end

  private

  def check_file_name(file_name)
    return if File.exist?(file_name)

    raise FileNotFound, "Please check your file name, the file you want to parse <#{file_name}> doesn't exist"
  end
end
