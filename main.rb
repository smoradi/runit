#!/usr/bin/env ruby

require File.expand_path('../wasrun', __FILE__)
require File.expand_path('../testcase', __FILE__)
require File.expand_path('../testsuite', __FILE__)
require File.expand_path('../testresult', __FILE__)

class TestCaseTest < RUnit::TestCase
  def setUp
    @result= RUnit::TestResult.new
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
    suite= RUnit::TestSuite.new
    suite.add(WasRun.new("testMethod"))
    suite.add(WasRun.new("testBrokenMethod"))
    suite.run(@result)
    assert_equal "2 run, 1 failed", @result.summary()
  end

end

if __FILE__ == $0
  suite= RUnit::TestSuite.new
  suite.add(TestCaseTest.new("testTemplateMethod"), 0)
  suite.add(TestCaseTest.new("testResult"), 1)
  suite.add(TestCaseTest.new("testFailedResult"), 2)
  suite.add(TestCaseTest.new("testFailedResultFormatting"))
  suite.add(TestCaseTest.new("testSuite"), 4)
  result= RUnit::TestResult.new
  suite.run(result)
  result.errors.each { |e| puts "\n #{e.message}" }
  puts "\nTook #{result.time} seconds"
  puts result.summary()
end
