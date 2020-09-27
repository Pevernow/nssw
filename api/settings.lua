nssw.mymapgenis = tonumber(minetest.settings:get('nssw.mymapgenis')) or 7
nssw.multimobs = tonumber(minetest.settings:get('nssw.multimobs')) or 1000

nssw.server_rainbow_staff = minetest.settings:get_bool('nssw.server_rainbow_staff', false)

nssw.energy_boosts = minetest.settings:get_bool('nssw.energy_boosts')

nssw.energy_lights = minetest.settings:get_bool('nssw.energy_lights')

nssw.unswappable_nodes = minetest.settings:get('nssw.unswappable_nodes') or ""
nssw.unswappable_nodes = nssw.unswappable_nodes:split(",")

nssw.spearmodifier = tonumber(minetest.settings:get('nssw.spearmodifier')) or 1
