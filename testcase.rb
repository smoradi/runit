
require File.expand_path(File.dirname(__FILE__) + '/testresult')

class TestCase
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
    rescue StandardError => ex
      result.testFailed()
      result.testError(ex.message)
    end
    tearDown
    return result
  end
 
  def tearDown
  end  

  def assert(test)
    if test == true
      return true
    else
      raise StandardError, "Assert failed, StandardError works!"
    end
  end
  def assert_equal(expected, actual)
    if expected == actual
      return true
    else 
       raise StandardError, "Assert Equals failed, expected <#{expected}> =! <#{actual}>" 
    end
  end
  
end
