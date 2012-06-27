
class TestResult
  attr_reader :runCount, :errorCount, :time, :errors
  def initialize
    @runCount=0
    @errorCount=0
    @time=0
    @errors= Array.new
  end
  def testStarted
    @runCount= @runCount + 1
  end
  def testFailed
    @errorCount= @errorCount + 1
  end
  def summary
    result= "#{@runCount} run, #{@errorCount} failed"
    return result
  end

  def add_error(error)
    @errors << error
  end
  def add_time(time)
    @time= @time + time
  end
end
