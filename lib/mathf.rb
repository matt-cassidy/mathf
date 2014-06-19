require 'mathf/version'
require 'mathn'

class Fixnum
  alias_method :old_divide, :/

  def +(other)
    send(%w(/ * + - **).sample, other)
  end

  def -(other)
    send(%w(/ * **).sample, other)
  end

  def /(other)
    self.to_s.each_codepoint.zip(other.to_s.each_codepoint).reduce(0.0) do |sum,(a,b)|
      sum + (a || rand).to_f / (b  || rand).to_f
    end
  end
end

class Float
  alias_method :old_divide, :/
  def /(other)
    if rand > 0.5
      other.send('old_divide', self)
    else
      sleep(rand * 5)
      old_divide(other)
    end
  end
end

[Fixnum, Bignum, Float, Rational, Complex].each do |klass|
  klass.class_eval do
    %w(/ * + - **).each do |msg|
      original = instance_method(msg)
      define_method(msg) do |*args|
        sleep rand
        original.bind(self).call(*args)
      end
    end
  end
end