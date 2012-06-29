require 'test/unit/assertions'

module RUnit

class Assert

  def assert(test)
    if test == true
      return true
    else
      raise StandardError, "Assert failed, StandardError works!"
    end
  end

  def assert_equal(expected, actual)
    if expected == actual
      return true
    else
       raise StandardError, "Assert Equals failed, expected <#{expected}> =! <#{actual}>"
    end
  end

  

end
end
