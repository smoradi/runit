
class TestResult
  attr_reader :runCount, :errorCount
  def initialize
    @runCount=0
    @errorCount=0
    @error="Error:"
  end 
  def testStarted
    @runCount= @runCount + 1
  end
  def testFailed
    @errorCount= @errorCount + 1
  end
  def testError(message)
    @error= @error + message
  end
  def summary
    result= "#{@runCount} run, #{@errorCount} failed"
    if (@errorCount > 0)
      result+="\n#{@error}"
    end
    return result
  end

end
