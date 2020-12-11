# frozen_string_literal: true

require_relative '../lib/line_dissection'
require_relative '../lib/unique_views_counter'

describe UniqueViewsCounter do
  describe 'add somthing to the hash' do
    # When you use let the state is reset for every it block and the value
    # is only evaluated if it is called from within the current it block.

    let(:test_unique_views_counter) { UniqueViewsCounter.new }

    # create some test lines
    let(:home_line_split) { LineDissection.new('/home 722.247.931.582') }
    let(:home_2_line_split) { LineDissection.new('/home 200.017.277.774') }
    let(:home_3_line_split) { LineDissection.new('/home 722.247.931.582') }
    let(:contact_line_split) { LineDissection.new('/contact 444.701.448.104') }
    let(:index_line_split) { LineDissection.new('/index 200.017.277.774') }
    let(:contact_2_line_split) { LineDissection.new('/contact 451.106.204.921') }

    # fill up the page_counts hash in test_page_visits_counter
    before do
      test_unique_views_counter.add_to_count(home_line_split)
      test_unique_views_counter.add_to_count(home_2_line_split)
      test_unique_views_counter.add_to_count(home_3_line_split)
      test_unique_views_counter.add_to_count(contact_line_split)
    end

    it 'prints the pages out in decending count order' do
      expect(test_unique_views_counter.print_result).to eq('2 unique views to page /home\n1 unique views to page /contact')
    end
    context 'the path does not already exist in the hash' do
      it 'adds the path to the hash page_counts' do
        # add index page ( not already in hash)
        test_unique_views_counter.add_to_count(index_line_split)
        expect(test_unique_views_counter.print_result).to eq('2 unique views to page /home\n1 unique views to page /contact\n1 unique views to page /index')
      end
    end

    context 'the path already exist in the hash but its a unique ip' do
      it 'increments the value associated with the path key' do
        test_unique_views_counter.add_to_count(contact_2_line_split)
        expect(test_unique_views_counter.print_result).to eq('2 unique views to page /home\n2 unique views to page /contact')
      end
    end
    context 'the path already exist in the hash and the ip is not unique' do
      it 'increments the value associated with the path key' do
        test_unique_views_counter.add_to_count(contact_line_split)
        expect(test_unique_views_counter.print_result).to eq('2 unique views to page /home\n1 unique views to page /contact')
      end
    end
  end
end
