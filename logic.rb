require "poke-api-v2"
require "http"
require "json"

# logic to get name of pokemon  
results = HTTP.get('https://pokeapi.co/api/v2/pokemon/300')
parsed_results = JSON.parse(results)
forms = parsed_results["forms"][0]["name"]


#api call for all pokemon 
all_pokemon = HTTP.get('https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20000"')
parse_poke = JSON.parse(all_pokemon)
poke_list = parse_poke["results"]

# extract number of pokemon from last pokemons id
last_pokemon = poke_list[-1]["url"]
num_pokemon = last_pokemon.match(/\/(\d+)\/$/)
rand = num_pokemon[1].to_i

# logic to get random number
ran_num = rand(1..#{rand})
pp ran_num
