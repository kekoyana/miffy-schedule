require 'rss'

# dickbruna class
class Dickbruna
  URL = 'https://www.dickbruna.jp/index.rdf'.freeze

  def resource
    @resource ||= RSS::Parser.parse(URL, true)
  end

  def items
    resource.items.map(&:description)
  end
end
