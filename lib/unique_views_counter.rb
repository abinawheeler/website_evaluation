# frozen_string_literal: true

# A set is a Ruby class that stores items like an array where every item is unique.
require 'set'

# contains a hash which stores page paths(k) and a tally of unique visits(v)
class UniqueViewsCounter
  def initialize
    # create a new hash and set default value to nil
    unique_path_counts = {}
    @unique_path_counts = unique_path_counts
  end

  def add_to_count(dissected_line)
    path = dissected_line.path
    ip = dissected_line.ip

    if unique_path_counts.key?(path)
      unique_path_counts[path] << ip
    else
      unique_path_counts[path] = Set.new([ip])
    end
  end

  def print_result
    # Print out in decending order the numbwer of unique visits to each path
    unique_path_counts.sort_by { |path, ips| [-ips.count] }.map { |path, ips| "#{ips.count} unique views to page #{path}" }.join("\n") 
  end

  private

  attr_reader :unique_path_counts
end
