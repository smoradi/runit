#!/usr/bin/env ruby

require File.expand_path(File.dirname(__FILE__) + '/wasrun')
require File.expand_path(File.dirname(__FILE__) + '/testcase')
require File.expand_path(File.dirname(__FILE__) + '/testresult')
require File.expand_path(File.dirname(__FILE__) + '/testsuite')

require 'test/unit/assertions'

class TestCaseTest < TestCase
  def setUp
    @result= TestResult.new
  end
  def testTemplateMethod
    test= WasRun.new("testMethod")
    test.run(@result)
    assert_equal "setUp testMethod tearDown", test.log
  end
  
  def testResult
    test= WasRun.new("testMethod")
    test.run(@result)
    assert_equal "1 run, 0 failed", @result.summary()  
  end
  def testFailedResult
   test= WasRun.new("testBrokenMethod")
   test.run(@result)
   assert_equal "1 run, 1 failed", @result.summary()
  end
  def testFailedResultFormatting
    @result.testStarted()
    @result.testFailed()
    assert_equal "1 run, 1 failed", @result.summary()
  end
  def testSuite
    suite= TestSuite.new
    suite.add(WasRun.new("testMethod"))
    suite.add(WasRun.new("testBrokenMethod"))
    suite.run(@result)
    assert_equal "2 run, 1 failed", @result.summary()
  end
  
end

if __FILE__ == $0
  suite= TestSuite.new
  suite.add(TestCaseTest.new("testTemplateMethod"))
  suite.add(TestCaseTest.new("testResult"))
  suite.add(TestCaseTest.new("testFailedResult"))
  suite.add(TestCaseTest.new("testFailedResultFormatting"))
  suite.add(TestCaseTest.new("testSuite"))
  result= TestResult.new
  suite.run(result)
  puts result.summary()
end
