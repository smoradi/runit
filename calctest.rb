#!/usr/bin/env ruby

require File.expand_path(File.dirname(__FILE__) + '/testcase')
require File.expand_path(File.dirname(__FILE__) + '/testsuite')
require File.expand_path(File.dirname(__FILE__) + '/testresult')
require File.expand_path(File.dirname(__FILE__) + '/calcrun')

#require 'test/unit/assertions'

class CalcTestCase < TestCase
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
  suite= TestSuite.new
  suite.add(CalcTestCase.new("testPlus"))
  suite.add(CalcTestCase.new("testMines"))
  suite.add(CalcTestCase.new("testMultiple"))
  suite.add(CalcTestCase.new("testDivide"))
  suite.add(CalcTestCase.new("testMixOfActions"))
  result= TestResult.new
  suite.run(result)
  i= 0
  result.errors.each { |e| i= i+1; puts "\n#{i}) #{e.message}" }
  puts "\nTook #{result.time} seconds"
  puts result.summary()
end
