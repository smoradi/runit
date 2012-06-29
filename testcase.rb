require File.expand_path('../asserts', __FILE__)
require File.expand_path('../testresult', __FILE__)

module RUnit

class TestCase < RUnit::Assert
  attr_accessor :name
  def initialize(name)
    @name= name
  end

  def setUp
  end

  def run(result)
    result.testStarted()
    setUp
    begin
      send(@name)
      print "."
    rescue StandardError => ex
      result.testFailed()
      result.add_error(ex)
      print "F"
    end
    tearDown
    return result
  end

  def tearDown
  end

end
end
