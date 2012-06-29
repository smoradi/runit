#!/usr/bin/env ruby

require File.expand_path('../testcase', __FILE__)
require File.expand_path('../testsuite', __FILE__)
require File.expand_path('../testresult', __FILE__)
require File.expand_path('../calcrun', __FILE__)

class CalcTestCase < RUnit::TestCase
  def setUp
    @calc= CalcRun.new
  end
  def testPlus
    assert_equal 2, @calc.plus(1,1)
    assert_equal 0, @calc.plus(-1,1)
    assert_equal -1, @calc.plus(0, -1)
    assert_equal "one", @calc.plus("", "one")
  end
  def testMines
    assert_equal 1, @calc.mines(2,1)
#    assert_equal "on", @calc.mines("one", "e")
  end
  def testMultiple
    assert_equal 4, @calc.multiple(2,2)
  end
  def testDivide
    assert_equal 2, @calc.divide(4,2)
  end
  def testMixOfActions
    assert_equal 1, (@calc.mines(@calc.plus(2,2), 3))
    assert_equal 1, (@calc.divide(@calc.multiple(2,2), 4))
  end

end

if __FILE__ == $0
  suite= RUnit::TestSuite.new
  suite.add(CalcTestCase.new("testPlus"), 0)
  suite.add(CalcTestCase.new("testMines"))
  suite.add(CalcTestCase.new("testDivide"))
  suite.add(CalcTestCase.new("testMultiple"), 1)
  suite.add(CalcTestCase.new("testMixOfActions"), 2)
  result= RUnit::TestResult.new
  suite.run(result) # suite.runAllPossibleOrders(result)
  result.errors.each { |e| puts "\n #{e.message}" }
  puts "\nTook #{result.time} seconds"
  puts result.summary()
end
