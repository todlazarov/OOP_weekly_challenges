# A Pythagorean triplet is a set of three natural numbers, {a, b, c}, for
# which,

# a**2 + b**2 = c**2

# For example, 3**2 + 4**2 = 9 + 16 = 25 = 5**2

class Triplet
  attr_reader :a, :b, :c

  def initialize(n1, n2, n3)
    @a = n1
    @b = n2
    @c = n3
  end

  def self.where(options)
    results = []
    max = options[:max_factor] || 10
    min = options[:min_factor] || 1
    sum = options[:sum]

    combinations(min.upto(max).to_a).each do |combo|
      triplet = Triplet.new(combo[0], combo[1], combo[2])

      if triplet.pythagorean?
        if sum
          results << triplet if triplet.sum == sum
        else
          results << triplet 
        end
      end
    end

    results
  end

  def self.combinations(arr)
    arr.product(arr).product(arr).map(&:flatten).map(&:sort).uniq
  end

  def sum
    a + b + c
  end

  def product
    a * b * c
  end

  def pythagorean?
    a ** 2 + b ** 2 == c ** 2
  end

end
