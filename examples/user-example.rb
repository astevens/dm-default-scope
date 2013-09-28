require 'dm-core'
require 'dm-default-scope'

DataMapper.setup(:default, "in_memory::")
class User
  include DataMapper::Resource
  include DataMapper::DefaultScope

  property :id, Serial
  property :active, Boolean
  set_default_scope({:active => true})
end
DataMapper.finalize #This is required by DataMapper to work (!)
User.create(active: false)
User.create(active: true)

puts "All active users: #{User.all.inspect}"
User.unscoped do
  puts "All users (even not active): #{User.all.inspect}"
end