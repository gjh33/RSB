require 'riot_set_builder/pro_builds/base'
require 'riot_set_builder/item'
require 'riot_set_builder/block'

#pro builds generates their build order html using react which is a js library.
#this makes it very difficult to parse that data, we'd need an entire browser
#emulator to get the final html.
module RiotSetBuilder
  module ProBuilds
    class BuildPage < Base
      def initialize(path)
        @path = path
        super()
      end

      def blocks
        [RiotSetBuilder::Block.new(type: "Final Items", items: final_items)]
      end

      def final_items
        final_item_elements.inject([]) do |items, element|
          items << final_item_for(element)
          items
        end
      end

      private

      def final_item_elements
        page = page_for(@path)
        page.search('div[class="left mb10"] li')
      end

      def final_item_for(element)
        #first find the span
        #second get the tooltip which is in the form items/####
        #get rid of the "items/" part
        #to int
        id = element.search('span').first['data-tooltip'].gsub('items/', '').to_i
        RiotSetBuilder::Item.new(id: id)
      end
    end
  end
end
