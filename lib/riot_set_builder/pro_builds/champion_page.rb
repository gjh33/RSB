require 'riot_set_builder/pro_builds/base'
require 'riot_set_builder/pro_builds/build_page'
require 'riot_set_builder/build'

module RiotSetBuilder
  module ProBuilds
    class ChampionPage < Base
      attr_accessor :champion

      def initialize(champion)
        @champion = champion
        super()
      end

      def recent_builds
        build_elements.inject([]) do |builds, element|
          builds << build_for(element)
          builds
        end
      end

      private

      def build_elements
        page = page_for(champion_path)
        page.search('[class="final-builds"] > a')
      end

      def champion_path
        "/champions/#{ champion }"
      end

      def build_for(element)
        player = element.search('.player').first.text
        path = path_of(element[:href])
        name = "PB - #{ player }"
        build_page = BuildPage.new(path)
        RiotSetBuilder::Build.new(title: name, champion: champion, mode: "CLASSIC", blocks: build_page.blocks)
      end
    end
  end
end
