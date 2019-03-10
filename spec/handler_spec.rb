# frozen_string_literal: true

require 'spec_helper'
require 'handler'
require 'webmock'

describe 'handler(event)' do
  include WebMock::API
  WebMock.enable!

  let(:event) do
    Event.new(
      body: nil,
      query_params: {},
      headers: {},
      context: nil
    )
  end

  before do
    stub_request(:get, 'https://www.dickbruna.jp/index.rdf').to_return(
      body: File.read('spec/sample/index.rdf'),
      status: 200
    )
  end

  it 'should return a String' do
    body = handler(event).body
    expect(body).to be_a(String)
  end

  it 'should reply 期間' do
    body = handler(event).body
    expect(body).to match(/<td>2019/)
  end
end
