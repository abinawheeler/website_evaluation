# frozen_string_literal: true

# contains a hash which stores page paths(k) and a tally of visits(v)
class PageVisitsCounter
  def initialize
    # create a new hash and set default value for any key to 0
    # so you can perform +=1 (nil doesn't understand how to ++ itself.)
    @page_counts = Hash.new(0)
  end

  def add_to_count(dissected_line)
    # add a new key and one count to the value or add one count to existing key value pair
    page_counts[dissected_line.path] += 1
  end

  def print_result
    # print out pages in decending order showing counts and path
    page_counts.sort_by { |page, count| [-count] }.map { |page, count| "#{count} visits to #{page}" }.join("\n")
  end

  private

  attr_accessor :page_counts
end
