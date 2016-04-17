def E(k, n)
  bins = []
  remainders = []
  k.times { |i| bins[i] = ['x'] }
  (n-k).times { |i| remainders[i] = ['.'] }

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

    if !new_remainders.empty?
      bins.pop new_remainders.count
      remainders = new_remainders
    end

    break unless remainders.size > 1
  end

  return (bins + remainders).flatten.join
end
