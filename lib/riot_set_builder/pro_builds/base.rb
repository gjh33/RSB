require 'mechanize'
require 'uri'

module RiotSetBuilder
  module ProBuilds
    class Base
      BASE_URL = 'http://www.probuilds.net'

      def initialize
        @agent = Mechanize.new
      end

      private

      def page_for(path)
        @agent.get(BASE_URL + path)
      end

      def path_of(url)
        uri = URI::parse(url)
        uri.path
      end
    end
  end
end
