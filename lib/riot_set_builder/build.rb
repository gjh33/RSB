module RiotSetBuilder
  class Build
    attr_accessor :title, :type, :map, :mode, :priority, :sortrank, :blocks

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
      raise "Title required for build" unless title
      raise "Invalid type, valid types are #{ VALID_OPTIONS.types }" unless VALID_OPTIONS[:types].include?(type)
      raise "Invalid map, valid maps are #{ VALID_OPTIONS.maps }" unless VALID_OPTIONS[:maps].include?(map)
      raise "invalid mode, valid modes are #{ VALID_OPTIONS.modes }" unless VALID_OPTIONS[:modes].include?(mode)
    end
  end
end
