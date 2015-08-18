module RiotSetBuilder
  module ProBuilds
    class Parser

      BASE_URL = 'http://www.probuilds.net'

      def self.recent_final_builds(champion)
        #request page for champion
        #parse body for list items
        #generate list of urls from list items
        #for each url, parse build
        #return all builds
      end

      def self.parse_build(url)
        #request build page
        #parse body for final items ul
        #parse body for buy order ul
        #create build
      end
    end
  end
end
