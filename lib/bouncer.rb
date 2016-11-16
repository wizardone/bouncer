require 'bouncer/version'
require 'bouncer/listener'
require 'bouncer/store'

module Bouncer
  def subscribe(object, **options)
    Bouncer::Store.register(object, options)
  end

  def unsubscribe(*objects)
    Bouncer::Store.unregister(objects)
  end

  def publish(scope, event, *args)
    Bouncer::Store.notify(scope, event, args)
  end

  def clear
    Bouncer::Store.clear
  end
  alias_method :clear_listeners, :clear
end
