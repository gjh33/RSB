require 'riot_set_builder/errors'

module RiotSetBuilder
  class Item
    include Error::Item

    attr_accessor :id, :count

    DEFAULT_OPTIONS = {
      count: 1
    }

    def initialize(options = {})
      options = DEFAULT_OPTIONS.merge(options)

      @id = options[:id]
      @count = options[:count]

      verify_attributes
    end

    def verify_attributes
      raise NoID, "Item requires an ID" unless id
      raise InvalidCount, "Item's count must be a number >= 0"  unless count >= 0
    end
  end
end
