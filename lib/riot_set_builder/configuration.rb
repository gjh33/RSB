module RiotSetBuilder
  module Configuration
    CONFIG_KEYS = [
      :league_path
    ].freeze

    DEFAULT_KEYS = {
      league_path: './'
    }

    attr_accessor *CONFIG_KEYS

    def configure
      yield self
    end

    def options
      CONFIG_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    def self.extended(base)
      base.reset_config
    end

    def reset_config
      CONFIG_KEYS.each do |key|
        if DEFAULT_KEYS[key]
          self.send("#{key}=", DEFAULT_KEYS[key])
        else
          self.send("#{key}=", nil)
        end
      end
    end
  end
end
