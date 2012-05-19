
class TestResult
  attr_reader :runCount, :errorCount
  def initialize
    @runCount=0
    @errorCount=0
  end
  def testStarted
    @runCount= @runCount + 1
  end
  def testFailed
    @errorCount= @errorCount + 1
  end
  def testError(testName, message)
    puts "\nERROR!!" + testName + ":" + message + "\n"
  end
  def summary
    result= "#{@runCount} run, #{@errorCount} failed"
    return result
  end

end
