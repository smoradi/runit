
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
    start_time= Time.now
    @tests.each {|test| test.run(result)}
    end_time = Time.now
    result.add_time(end_time - start_time)
    return result
  end

end
