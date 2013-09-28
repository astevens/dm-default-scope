[![Gem Version](https://badge.fury.io/rb/dm-default-scope.png)](http://badge.fury.io/rb/dm-default-scope)
# Use a default scope with datamapper

DataMapper does not provide a way to set a default scope in a model.
If you need, for example, to handle soft deletes, it is a must to have
a default scope with :deleted =>false as a condition.

This library recreates the absolutely minimal feature for setting a default
scope

## Usage

      class User
        include DataMapper::Resource
        include DataMapper::DefaultScope

        property :id, Serial
        property :email, String
        property :deleted, Boolean

        set_default_scope({:deleted=> false})
      end

      User.create(email: 'john@doe.com', deleted: true)
      User.get(1) #=> nil

##Unscoped

If you need to bypass the default scope you can do it inside an unscoped block:

      User.unscoped do
        User.get(1) #=> <User @id=1 @email="john@doe.com" @deleted=true>
      end        
