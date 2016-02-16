require 'pry'

class SecretHandshake

  def initialize(n)
    @data = n
  end

  def commands
    results = []

    bin_num = @data.to_s(2) if @data.class == Fixnum or return results

    bin_num.reverse!
    results.push("wink") if bin_num[0] == '1'
    results.push("double blink") if bin_num[1] == '1'
    results.push("close your eyes") if bin_num[2] == '1'
    results.push("jump") if bin_num[3] == '1'
    results.reverse! if bin_num[4] == '1'

    results
  end

end