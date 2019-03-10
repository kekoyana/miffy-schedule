# frozen_string_literal: true

require 'rss'
require 'models/article'

# dickbruna class
class Dickbruna
  URL = 'https://www.dickbruna.jp/index.rdf'
  attr_accessor :articles

  def initialize
    build_articles
  end

  def resource
    @resource ||= RSS::Parser.parse(URL, true)
  end

  private

  def build_articles
    @articles = resource.items.each_with_object([]) do |item, ary|
      article = build_article_by(item)
      next unless article

      ary << article
    end
  end

  def build_article_by(item)
    matches = item.description.match(/期間：(.+)場所：(.+)/)
    return unless matches

    Article.new do |article|
      article.period = matches[1]
      article.place  = matches[2]
      article.title  = item.title
      article.body   = item.description
      article.link   = item.link
    end
  end
end
