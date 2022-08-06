# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/extensiontask"

task build: :compile

Rake::ExtensionTask.new("rust_uuid") do |ext|
  ext.lib_dir = "lib/rust_uuid"
end

task default: %i[clobber compile]
