ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require_relative 'shirts.rb'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe 'shirt model' do
  it 'should contain an id and filename' do
    new_shirt = Shirt.create(filename: "ceiling-cat.gif")
    new_shirt.id.must_be_kind_of(Integer)
    assert_equal "ceiling-cat.gif", new_shirt.filename
  end
end

describe 'shirt controller' do
  before do
    @new_shirt = Shirt.create(filename: "ceiling-cat.gif")
  end

  it 'should return json' do
    get "/shirt/#{@new_shirt.id.to_s}"
    assert_equal 'application/json', last_response.headers['Content-Type']
  end

  it 'should return an ok status' do
    get "/shirt/#{@new_shirt.id.to_s}"
    assert_equal 200, last_response.status
  end

  it 'should return a not found status if shirt does not exist' do
    get '/shirt/30421134382822222111'
    assert_equal 404, last_response.status
  end

  it 'should return proper content given id' do
    get "/shirt/#{@new_shirt.id.to_s}"

    expected = { filename: "ceiling-cat.gif", url: "http://127.0.0.1:4567/img/ceiling-cat.gif" }.to_json
    assert_equal expected, last_response.body
  end

  it 'should return a random shirt' do
    Shirt.create(filename: "ceiling-cat2.gif")
    Shirt.create(filename: "ceiling-cat3.gif")

    get 'shirt/random'

    JSON.parse(last_response.body)["filename"].must_be_kind_of(String)
    JSON.parse(last_response.body)["url"].must_be_kind_of(String)
  end

  it 'should return a cat given a filename' do
    get "/shirt/filename/ceiling-cat.gif"

    expected = { filename: "ceiling-cat.gif", url: "http://127.0.0.1:4567/img/ceiling-cat.gif" }.to_json
    assert_equal expected, last_response.body
  end

end
