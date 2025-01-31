require "poke-api-v2"
require "http"
require "json"

# logic to get random number
random_id = rand(1..1025)

# logic to get name of pokemon  
poke_url = "https://pokeapi.co/api/v2/pokemon/" + "71"
results = HTTP.get(poke_url)
parsed_results = JSON.parse(results)
poke_name = parsed_results["forms"][0]["name"]
pp poke_name

# logic to get pokemon info

# height in decimeters
poke_height = parsed_results["height"]
# weight in hectograms
poke_weight = parsed_results["weight"]
# type
poke_types = parsed_results["types"].map { |i| i["type"]["name"] }
# moves
num_moves = parsed_results["moves"].count
moves_list = parsed_results["moves"].map { |i| i["move"]["name"]}
random_move = moves_list.sample
picture = parsed_results["sprites"]["front_default"] || parsed_results["sprites"]["front_shiny"] || parsed_results["sprites"]["front_female"]
pp picture
