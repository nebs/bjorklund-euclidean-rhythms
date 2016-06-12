def E(k, n)
  return "" if n == 0 || k == 0

  bins = []
  remainders = []
  k.times { |i| bins[i] = ['x'] }
  (n-k).times { |i| remainders[i] = ['.'] }

  return bins.flatten.join if n == k

  loop do
    new_remainders = []
    bins.each_with_index do |bin, i|
      if remainders.empty?
        new_remainders.push bin
      else
        bin += remainders.shift
        bins[i] = bin
      end
    end

    if new_remainders.any?
      bins.pop new_remainders.count
      remainders = new_remainders
    end

    break unless remainders.size > 1
  end

  return (bins + remainders).flatten.join
end
