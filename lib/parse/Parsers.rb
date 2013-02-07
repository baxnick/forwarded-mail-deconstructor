require 'parse/Lexical'
require 'parse/Email'
require 'parse/EmailList'
require 'treetop'

class Treetop::Runtime::SyntaxNode
  def export
    return nil if !elements
    elements.map{ |e| e.export if defined? e.export }.reject{ |e| e.nil? or e.empty? }
  end
end

