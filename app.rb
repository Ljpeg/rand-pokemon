require 'sinatra'
require 'sinatra/reloader'
require 'http'
require 'json'

# Set to serve static files like css
set :public_folder, "#{File.dirname(__FILE__)}/public"

#  Set the bind address to '0.0.0.0' so that the app can accept connections from all network interfaces
set :bind, '0.0.0.0'

# Set the port to the value of the PORT environment variable, or default to 10000 if not set.
set :port, ENV['PORT'] || 10_000 # Optionally set a custom port

get('/') do
  erb(:home)
end

get('/new') do
  random_id = rand(1..1025)
  url = "https://pokeapi.co/api/v2/pokemon/#{random_id}"

  results = HTTP.get(url)
  parsed_results = JSON.parse(results)
  sprites = parsed_results.fetch('sprites')

  @name = parsed_results['forms'][0]['name'].capitalize
  @height = parsed_results['height']
  @weight = parsed_results['weight']
  @types = parsed_results['types'].map { |i| i['type']['name'] }
  @moves = parsed_results['moves'].map { |i| i['move']['name'] }
  @num_moves = parsed_results['moves'].count
  @random_move = @moves.sample

  @pic = [
    sprites.fetch('front_default'),
    sprites.fetch('front_shiny'),
    sprites.fetch('front_female')
  ].compact.at(0)

  erb(:pokemon)
end
