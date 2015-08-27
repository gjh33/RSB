require 'riot_set_builder/pro_builds/base'

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
        #ChampionParser.new(champion)
        #ChampionParser.recent_builds
      end

      private

      def paramaterize(name)
        name.delete "' ."
      end
    end
  end
end
