require "sinatra"
require "sinatra/reloader"
require "http"
require "json"


get("/") do
  "
  <h1>Welcome to your Pokemon Generator</h1>
  "
  erb(:home)
end

get("/new") do
random_id = rand(1..1025)
url = "https://pokeapi.co/api/v2/pokemon/" + "#{random_id}"

results = HTTP.get(url)
parsed_results = JSON.parse(results)

@name = parsed_results["forms"][0]["name"].capitalize
@height = parsed_results["height"]
@weight = parsed_results["weight"]
@types = parsed_results["types"].map { |i| i["type"]["name"] }
@moves = parsed_results["moves"].map { |i| i["move"]["name"]}
@num_moves = parsed_results["moves"].count
@random_move = @moves.sample
@pic = parsed_results["sprites"]["front_default"] || parsed_results["sprites"]["front_shiny"] || parsed_results["sprites"]["front_female"]

erb(:pokemon)
end 
