#!/usr/bin/env ruby

require File.expand_path('../testcase', __FILE__)
require File.expand_path('../testsuite', __FILE__)
require File.expand_path('../testresult', __FILE__)
require File.expand_path('../asserts', __FILE__)

class AssertTest < RUnit::TestCase
  def setUp
    @assert= RUnit::Assert.new
  end

  def testAssertEqual
    @assert.assert_equal 1, 1
    sleep 0.0000001
  end
end

if __FILE__ == $0
  suite= RUnit::TestSuite.new
  suite.add(AssertTest.new("testAssertEqual"), 0)
  result= RUnit::TestResult.new
  suite.runAllPossibleOrders(result)
  result.errors.each {|e| puts "\n #{e.messagei}" }
  puts "\nTook #{result.time} seconds"
  puts result.summary()
end
