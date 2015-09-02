require 'riot_set_builder/pro_builds/base'
require 'riot_set_builder/pro_builds/champion_page'

module RiotSetBuilder
  module ProBuilds
    class Parser < Base
      def champions
        page = page_for('/champions')
        champion_names = page.search('a.block .left h3')
        champion_names.inject([]) do |champions, name|
          champion = paramaterize(name.text).to_sym
          champions << champion
          champions
        end.uniq
      end

      def recent_builds_for(champion)
        ChampionPage.new(champion).recent_builds
      end

      def all_recent_builds
        champions.inject({}) do |hash, champion|
          puts "working on #{champion}..."
          hash[champion] = recent_builds_for(champion)
          puts "finished."
          hash
        end
      end

      private

      def paramaterize(name)
        name.delete "' ."
      end
    end
  end
end
