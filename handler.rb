# frozen_string_literal: true

require 'haml'
require 'models/dickbruna'

def haml(template)
  file_path = File.join(File.expand_path(__dir__), 'views', "#{template}.haml")
  haml_data = File.read(file_path)
  render html: Haml::Engine.new(haml_data).render(self)
end

def handler(_event)
  dickbruna = Dickbruna.new
  @items = dickbruna.articles

  haml :index
end
