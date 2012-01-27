
class TestSuite
  def initialize
    @tests= Array.new
  end
  def add(test)
    @tests << test
  end

  def addTestCase(testcase)
    # TODO:: automatically add all test methods
  end
  
  def run(result)
    @tests.each {|test| test.run(result)}
    return result
  end

end
