def E(k, n)
  bins = []
  reserves = []
  k.times { |i| bins[i] = ['x'] }
  (n-k).times { |i| reserves[i] = ['.'] }

  loop do
    new_reserves = []
    bins.each_with_index do |bin, i|
      if reserves.empty?
        new_reserves.push bin
      else
        bin += reserves.shift
        bins[i] = bin
      end
    end

    if !new_reserves.empty?
      bins.pop new_reserves.count
      reserves = new_reserves
    end

    break unless reserves.size > 1
  end

  return (bins + reserves).flatten.join
end
