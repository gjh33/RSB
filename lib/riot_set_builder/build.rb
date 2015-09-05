require 'riot_set_builder/errors'
require 'riot_set_builder/item'

module RiotSetBuilder
  class Build
    include Error::Build

    attr_accessor :title, :champion, :type, :map, :mode, :priority, :sortrank, :blocks

    DEFAULT_OPTIONS = {
      type: "global",
      map: "SR",
      mode: "any",
      priority: false,
      sortrank: 0,
      blocks: []
    }

    VALID_OPTIONS = {
      types: [ "global", "custom" ],
      maps: [ "any", "SR", "HA", "TT", "CS" ],
      modes: [ "any", "CLASSIC", "ARAM", "ODIN" ]
    }

    def initialize(options = {})
      options = DEFAULT_OPTIONS.merge(options)

      @title = options[:title]
      @champion = options[:champion]
      @type = options[:type]
      @map = options[:map]
      @mode = options[:mode]
      @priority = options[:priority]
      @sortrank = options[:sortrank]
      @blocks = options[:blocks]

      verify_attributes
    end

    private

    def verify_attributes
      raise NoTitle, "Title required for build" unless title
      raise InvalidType, "Invalid type, valid types are #{ VALID_OPTIONS[:types] }" unless VALID_OPTIONS[:types].include?(type)
      raise InvalidMap, "Invalid map, valid maps are #{ VALID_OPTIONS[:maps] }" unless VALID_OPTIONS[:maps].include?(map)
      raise InvalidMode, "invalid mode, valid modes are #{ VALID_OPTIONS[:modes] }" unless VALID_OPTIONS[:modes].include?(mode)
    end
  end
end
