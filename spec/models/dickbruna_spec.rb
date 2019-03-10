# frozen_string_literal: true

require 'spec_helper'
require 'models/dickbruna'
require 'webmock'
require 'pry'

describe 'Dickbruna' do
  include WebMock::API
  WebMock.enable!

  let(:dickbruna) { Dickbruna.new }

  before do
    stub_request(:get, 'https://www.dickbruna.jp/index.rdf').to_return(
      body: File.read('spec/sample/index.rdf'),
      status: 200
    )
  end

  it 'sampleデータが取得できている' do
    expect(Dickbruna.new.resource.channel.title).to match(/sample/)
  end
end
