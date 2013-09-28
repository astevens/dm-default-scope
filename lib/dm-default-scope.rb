module DataMapper
  module DefaultScope
    def self.included(base)
      base.send(:extend, ClassMethods)
    end

    module ClassMethods
      def default_scope(*args)
        return Thread.current[scope_key] if Thread.current[scope_key]
        return @default_scope ||{}
      end

      def set_default_scope(scope)
        @default_scope = scope
      end

      def unscoped
        Thread.current[scope_key] = {}
        result = yield
      ensure
        Thread.current[scope_key] = nil
      end

      def scope_key
        "dm_default_scope_#{self}"
      end
    end
  end
end