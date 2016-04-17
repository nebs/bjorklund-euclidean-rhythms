require_relative 'src/bjorklund_euclid'

k = ARGV[0].to_i
n = ARGV[1].to_i
puts "E(#{k},#{n})=[#{E(k,n)}]"
