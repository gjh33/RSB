require 'mechanize'

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
    end
  end
end
