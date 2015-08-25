require "riot_set_builder/version"
require "riot_set_builder/configuration"

module RiotSetBuilder
  extend Configuration

  def self.generate_builds
    #pro_builds = ProBuilds::Parser.recent_completed_builds.first(3)
    #BuildFile.new(LEAGUE_PATH)
    #BuildFile.clear
    #BuildFile.add(pro_builds)
  end
end
