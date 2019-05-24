# frozen_string_literal: true

guard :rack do
  watch('gems.locked')
  watch('app.rb')
  watch('db/schema.rb')
  watch('db/seeds.rb')
  watch(%r{^models/.*\.rb})
end
