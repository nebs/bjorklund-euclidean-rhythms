require_relative 'src/bjorklund_euclid'

class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end
end

test_cases = [
  { k:5, n:13,  e:"x..x.x..x.x.."},
  { k:3, n:8,   e:"x..x..x."},
  { k:5, n:8,   e:"x.xx.xx."},
  { k:1, n:2,   e:"x."},
  { k:1, n:3,   e:"x.."},
  { k:1, n:4,   e:"x..."},
  { k:4, n:12,  e:"x..x..x..x.."},
  { k:2, n:3,   e:"x.x"},
  { k:2, n:5,   e:"x.x.."},
  { k:3, n:4,   e:"x.xx"},
  { k:3, n:5,   e:"x.x.x"},
  { k:3, n:7,   e:"x.x.x.."},
  { k:3, n:8,   e:"x..x..x."},
  { k:4, n:7,   e:"x.x.x.x"},
  { k:4, n:9,   e:"x.x.x.x.."},
  { k:4, n:11,  e:"x..x..x..x."},
  { k:5, n:6,   e:"x.xxxx"},
  { k:5, n:7,   e:"x.xx.xx"},
  { k:5, n:8,   e:"x.xx.xx."},
  { k:5, n:9,   e:"x.x.x.x.x"},
  { k:5, n:11,  e:"x.x.x.x.x.."},
  { k:5, n:12,  e:"x..x.x..x.x."},
  { k:5, n:16,  e:"x..x..x..x..x..."},
  { k:7, n:8,   e:"x.xxxxxx"},
  { k:7, n:12,  e:"x.xx.x.xx.x."},
  { k:7, n:16,  e:"x..x.x.x..x.x.x."},
  { k:9, n:16,  e:"x.xx.x.x.xx.x.x."},
  { k:11, n:24, e:"x..x.x.x.x.x..x.x.x.x.x."},
  { k:13, n:24, e:"x.xx.x.x.x.x.xx.x.x.x.x."},
]

num_passes = 0
for test_case in test_cases
  k = test_case[:k]
  n = test_case[:n]
  e = test_case[:e]
  real_e = E(k,n)
  did_succeed = real_e == e
  num_passes += 1 if did_succeed

  k = format('%02d', k)
  n = format('%02d', n)
  output = "E(#{k}, #{n}) | [#{real_e}] == [#{e}]"
  if did_succeed
    output = output.green
  else
    output = output.red
  end
  puts output
end
puts "-------------------"
passes = "PASSES: #{num_passes}".green
failures = "FAILURES: #{test_cases.size - num_passes}".red
puts "TOTAL: #{test_cases.size} #{passes} #{failures}"
