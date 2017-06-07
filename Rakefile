require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rubocop/rake_task"

# Endpoint specs make an actual HTTP requests so we exclude them from CI.
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = "--tag ~endpoint"
end

RuboCop::RakeTask.new(:rubocop)

task default: [:spec, :rubocop]
