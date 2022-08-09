require "benchmark/ips"
require "securerandom"
require "uuid"
require "rust_uuid"

Benchmark.ips do |x|
  x.report("standard") { SecureRandom.uuid }
  x.report("uuid") { UUID.generate }
  x.report("rust lib") { RustUUID.v4 }
  x.compare!
end
