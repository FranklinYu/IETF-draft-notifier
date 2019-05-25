# frozen_string_literal: true

guard :rack do
  watch('gems.locked')
  watch('app.rb')
  watch('db/schema.rb')
  watch('db/seeds.rb')
  watch(%r{^lib/(.+)\.rb$})
  watch(%r{^models/.*\.rb})
end

guard :rspec, cmd: 'rspec' do
  watch('gems.locked') { 'spec' }
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^spec/.+_spec\.rb$})
  watch('spec/spec_helper.rb')  { 'spec' }
end
