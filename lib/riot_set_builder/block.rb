require 'riot_set_builder/errors'

module RiotSetBuilder
  class Block
    include Error::Block

    attr_accessor :type, :rec_math, :min_summoner_level, :max_summoner_level,
                  :show_if_summoner_spell, :hide_if_summoner_spell, :items

    DEFAULT_OPTIONS = {
      type: "Block",
      rec_math: false,
      min_summoner_level: -1,
      max_summoner_level: -1,
      show_if_summoner_spell: "",
      hide_if_summoner_spell: "",
      items: []
    }

    def initialize(options = {})
      options = DEFAULT_OPTIONS.merge(options)

      @type = options[:type]
      @rec_math = options[:rec_math]
      @min_summoner_level = options[:min_summoner_level]
      @max_summoner_level = options[:max_summoner_level]
      @show_if_summoner_spell = options[:show_if_summoner_spell]
      @hide_if_summoner_spell = options[:hide_if_summoner_spell]
      @items = options[:items]

      verify_attributes
    end

    private

    def verify_attributes
      raise InvalidMinLevel, "min_summoner_level must be greater than -1" unless min_summoner_level >= -1
      raise InvalidMaxLevel, "max_summoner_level must be greater than -1" unless max_summoner_level >= -1
    end
  end
end
