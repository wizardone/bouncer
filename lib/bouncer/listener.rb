module Bouncer
  class ScopeMissingError < StandardError
    def initialize
      'You must supply a scope for running the events'
    end
  end

  class Listener
    attr_reader :object, :options

    def initialize(object, options)
      raise Bouncer::ScopeMissingError unless options[:scope]

      @object = object
      @options = options
    end

    def for?(scope)
      options[:scope] == scope
    end
  end
end
