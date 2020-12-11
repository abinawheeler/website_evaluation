# Website Evaluation Tool
A ruby script that receives the parameters webserver.log file and count_type as arguments.</br>

The webserver.log file contains a list of partial URL’s (just the path element) corresponding to the pages of the website, followed by the IP address of the visit</br>
e.g.</br>
/home 336.284.013.698</br>
/about 929.398.951.889</br>
/help_page/1 836.973.694.403</br>

The script parses each line of the webserver.log file and calculates either the total number of hits to each page or the unique hits to each page depending on the command line entry selected.</br>

For unique views the script output is :</br>
username-macbook:website_evaluation user$ ruby bin/parser.rb webserver.log -c unique_views</br>
/help_page/1 23 unique views</br>
/contact 23 unique views</br>
/home 23 unique views</br>
/index 23 unique views</br>
/about/2 22 unique views</br>
/about 21 unique views</br>

For page hits the script output is :</br>
username-macbook:website_evaluation user$ ruby bin/parser.rb webserver.log -c page_view_count</br>
90 visits to /about/2</br>
89 visits to /contact</br>
82 visits to /index</br>
81 visits to /about</br>
80 visits to /help_page/1</br>
78 visits to /home</br>

# Dependencies
ruby-2.6.3</br>
rspec</br>

# Installation
Clone or unpack this repo</br>
use ruby-2.6.3</br>
$ bundle install</br>

# Usage
$ cd path_to/project_folder</br>
for total page hits:</br>
$ ruby bin/parser.rb webserver.log --count_type number_page_visits</br>
for unique page hits:</br>
$ ruby bin/parser.rb webserver.log --count_type page_unique_views</br>

# Specs
to run the test use</br>
$ bundle exec rspec</br>


