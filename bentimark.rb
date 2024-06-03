require "benchmark/ips"
require "securerandom"
require "rust_uuid"
require "uuid7"

Benchmark.ips do |x|
  x.report("standard") { SecureRandom.uuid }
  x.report("uuidv4: rust lib") { RustUUID.v4 }
  x.compare!
end

Benchmark.ips do |x|
  x.report("uuid7") { UUID7.generate }
  x.report("uuidv7: rust lib") { RustUUID.v7 }
  x.compare!
end
