require File.expand_path(File.dirname(__FILE__) + '/testcase')

class WasRun < TestCase
  attr_reader :wasRun, :wasSetUp
  attr_accessor :name, :log
  def initialize(name)
    super(name)
  end
  def setUp
    @wasRun= nil
    @log= "setUp "
  end

  def testMethod
    @log= @log + "testMethod "
  end

  def testBrokenMethod
    raise StandardError
  end

  def tearDown
    @log= @log + "tearDown"
  end	

end
