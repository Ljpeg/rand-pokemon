require "poke-api-v2"
require "http"
require "json"

# logic to get random number
random_id = rand(1..1025)

# logic to get name of pokemon  
poke_url = "https://pokeapi.co/api/v2/pokemon/" + "#{random_id}"
results = HTTP.get(poke_url)
parsed_results = JSON.parse(results)
poke_name = parsed_results["forms"][0]["name"]
pp poke_name

# logic to get pokemon info
