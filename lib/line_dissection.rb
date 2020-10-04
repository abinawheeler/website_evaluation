# an object contain the two attricutes path and ip. Taken from a unique line of the log file 
class LineDissection
  
  def initialize(line)
    
    @split_string = line.split(' ')
    @path = @split_string[0]
    @ip = @split_string[1]
   
  end

  attr_reader :path, :ip
end

