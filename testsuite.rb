module RUnit

class TestSuite
  attr_accessor :orderedTests, :randomTests
  def initialize
    @orderedTests= Array.new
    @randomTests= Array.new
  end
  def add (test, row = nil)
    if ( row.nil? )
      @randomTests << test
    else
      @orderedTests[row]= test
    end
  end

  def addTestCase (testcase)
    # TODO:: automatically add all test methods
  end

  def run (result)
    start_time= Time.now
    @orderedTests.each {|test| if (!test.nil?); test.run(result); end }
    @randomTests.each {|test| test.run(result)}
    result.add_time(Time.now - start_time)
    return result
  end

  def runAllPossibleOrders (result)
    start_time= Time.now
    array= @orderedTests + @randomTests
    array.permutation(array.size) {|array_x|
      array_x.each {|test| if (!test.nil?); test.run(result); end }
    }
    result.add_time(Time.now - start_time)
    return result
  end
end
end
