require 'parse/node_extensions'
require 'treetop'

module Parse
  class Parser
    Treetop.load('lib/parse/EmailChain')
    @@parser = EmailChainParser.new

    def self.parse(blah)
      @@parser.parse(blah)
    end

    def self.p
      @@parser
    end
  end
end

