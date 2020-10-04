require_relative '../lib/line_dissection'
require_relative '../lib/page_visits_counter'


describe PageVisitsCounter do
 
  describe "add somthing to the hash" do
    #When you use let the state is reset for every it block and the value 
    #is only evaluated if it is called from within the current it block.
  
    let(:test_page_visits_counter){PageVisitsCounter.new}
    
    #create some test lines 
    let(:help_page_1_line_split){LineDissection.new("/help_page/1 722.247.931.582")}
    let(:about_line_split){LineDissection.new("/about/2 200.017.277.774")}
    let(:home_line_split){LineDissection.new("/home 722.247.931.582")}
    let(:contact_line_split){LineDissection.new("/contact 444.701.448.104")}
    let(:index_line_split){LineDissection.new("/index 200.017.277.774")}
    
    #fill up the page_counts hash in test_page_visits_counter
    before do
      test_page_visits_counter.add_to_count(help_page_1_line_split)
      test_page_visits_counter.add_to_count(help_page_1_line_split)
      test_page_visits_counter.add_to_count(about_line_split)
      test_page_visits_counter.add_to_count(about_line_split)
      test_page_visits_counter.add_to_count(about_line_split)
      test_page_visits_counter.add_to_count(about_line_split)
      test_page_visits_counter.add_to_count(home_line_split)
      test_page_visits_counter.add_to_count(contact_line_split)
      test_page_visits_counter.add_to_count(contact_line_split)
      test_page_visits_counter.add_to_count(contact_line_split)
    end
   
    context "the path does not already exist in the hash" do
      
      it "adds the path /help_page/1 to the hash page_counts" do
        #add index page ( not already in hash) 
        test_page_visits_counter.add_to_count(index_line_split)
        
        expect(test_page_visits_counter.print_result).to eq("4 visits to /about/2\n3 visits to /contact\n2 visits to /help_page/1\n1 visits to /home\n1 visits to /index")
       
      end
      
    end
    
    context "the path already exist in the hash" do
      
      it "increments the value associated with the path key " do
        test_page_visits_counter.add_to_count(contact_line_split)
        
       
        expect(test_page_visits_counter.print_result).to eq("4 visits to /about/2\n4 visits to /contact\n2 visits to /help_page/1\n1 visits to /home")
       
      end
      
    end
    
    it "prints the pages out in decending count order" do
      test_page_visits_counter.add_to_count(index_line_split)
      test_page_visits_counter.add_to_count(index_line_split)
      test_page_visits_counter.add_to_count(index_line_split)
      test_page_visits_counter.add_to_count(index_line_split)
      test_page_visits_counter.add_to_count(index_line_split)
      
      expect(test_page_visits_counter.print_result).to eq("5 visits to /index\n4 visits to /about/2\n3 visits to /contact\n2 visits to /help_page/1\n1 visits to /home")
    end
    
    
  end

end