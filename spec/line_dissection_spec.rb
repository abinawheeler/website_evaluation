
require_relative '../lib/line_dissection'

describe LineDissection do
  let(:dissected_line) { LineDissection.new("test/home/4 123.456.789.000")}

  describe "initialize" do
    it "should split the origional line from the log file into path and ip attributes" do
      expect(dissected_line.path).to eq("test/home/4")
      expect(dissected_line.ip).to eq("123.456.789.000")
    end
  end

end