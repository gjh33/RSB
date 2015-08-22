module RiotSetBuilder
  module Error
    module Build
      class NoTitle < StandardError; end
      class InvalidType < StandardError; end
      class InvalidMap < StandardError; end
      class InvalidMode < StandardError; end
    end

    module Item
      class NoID < StandardError; end
      class InvalidCount < StandardError ; end
    end
  end
end
