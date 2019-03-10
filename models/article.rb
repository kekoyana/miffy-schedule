# frozen_string_literal: true

# Article class
class Article
  attr_accessor :period, :place, :title, :body, :link

  def initialize
    yield(self)
  end
end
