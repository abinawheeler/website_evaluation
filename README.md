# Website Evaluation Tool
A ruby script that receives the parameters webserver.log file and count_type as arguments. 

The webserver.log file contains a list of partial URL’s (just the path element) corresponding to the pages of the website, followed by the IP address of the visit 
e.g.
/home 336.284.013.698
/about 929.398.951.889
/help_page/1 836.973.694.403

The script parses each line of the webserver.log file and calculates either the total number of hits to each page or the unique hits to each page depending on the command line entry selected.

For unique views the script output is :
username-macbook:website_evaluation user$ ruby bin/parser.rb webserver.log -c unique_views
/help_page/1 23 unique views
/contact 23 unique views
/home 23 unique views
/index 23 unique views
/about/2 22 unique views
/about 21 unique views

For page hits the script output is :
username-macbook:website_evaluation user$ ruby bin/parser.rb webserver.log -c page_view_count
90 visits to /about/2
89 visits to /contact
82 visits to /index
81 visits to /about
80 visits to /help_page/1
78 visits to /home

# Dependencies
ruby-2.6.3
rspec

# Installation
Clone or unpack this repo
use ruby-2.6.3
$ bundle install

# Usage
$ cd path_to/project_folder
for total page hits: 
$ ruby bin/parser.rb webserver.log --count_type number_page_visits
for unique page hits: 
$ ruby bin/parser.rb webserver.log --count_type page_unique_views

# Specs
to run the test use
$ bundle exec rspec


