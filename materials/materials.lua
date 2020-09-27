nssw:load("materials/craft_items.lua")
nssw:load("materials/ores.lua")
nssw:load("materials/energy_globes.lua")

--nodes

minetest.register_node("nssw:ant_dirt", {
    description = "Ant Dirt",
    tiles = {"ant_dirt.png"},
    groups = {crumbly=3},
})

minetest.register_node("nssw:dead_leaves", {
    description = "Dead leaves",
    tiles = {"dead_leaves.png"},
    groups = {snappy=3,leaves=1},
})

minetest.register_node("nssw:invisible_light", {
    description = "Invisible light source",
    tiles = {"transparent.png"},
    paramtype = "light",
    drawtype = "airlike",
    walkable = false,
    sunlight_propagates = true,
    pointable = false,
    diggable = false,
    buildable_to = true,
    is_ground_content = false,
    groups = {unbreakable=1},
    drop = "",
    light_source = LIGHT_MAX,
})

minetest.register_node("nssw:venomous_gas", {
    description = "Venomous Gas",
    inventory_image = minetest.inventorycube("venomous_gas2.png"),
    drawtype = "firelike",
    tiles = {
        {name="venomous_gas_animated2.png", animation={type="vertical_frames", aspect_w=64, aspect_h=64, length=3.0}}
    },
    paramtype = "light",
    walkable = false,
    sunlight_propagates = true,
    pointable = false,
    diggable = false,
    buildable_to = true,
    drop = "",
    drowning = 1,
    damage_per_second = 1,
    post_effect_color = {a=100, r=1, g=100, b=1},
    groups = {flammable = 2},
})

minetest.register_node("nssw:modders_block", {
    description = "Modders Block",
    tiles = {"modders_block.png"},
    is_ground_content = true,
    groups = {crumbly=3, not_in_creative_inventory =1},
})

minetest.register_node("nssw:web", {
    description = "Web",
    inventory_image = "web.png",
    tiles = {"web.png"} ,
    drawtype = "plantlike",
    paramtype = "light",
    walkable = false,
    pointable = true,
    diggable = true,
    buildable_to = false,
    drop = "farming:cotton",
    drowning = 0,
    liquid_renewable = false,
    liquidtype = "source",
    liquid_range= 0,
    liquid_alternative_flowing = "nssw:web",
    liquid_alternative_source = "nssw:web",
    liquid_viscosity = 20,
    groups = {flammable=2, snappy=1, liquid=1},
    on_dig = function(pos, node, digger)
        local winame = digger:get_wielded_item():get_name()
        local wi = minetest.registered_tools[winame]

        if wi and wi.groups and wi.groups.webdigger then
            local range = (5-wi.groups.webdigger)/2
            local webnodes = minetest.find_nodes_in_area(
                {x=pos.x-range, y=pos.y-range, z=pos.z-range},
                {x=pos.x+range, y=pos.y+range, z=pos.z+range},
                {"nssw:web"}
            )

            for _,nodepos in ipairs(webnodes) do
                if not minetest.is_protected(nodepos, digger:get_player_name()) then
                    minetest.remove_node(nodepos)
                    if math.random(1,range*4) == 1 then
                        minetest.add_item(nodepos, "farming:cotton")
                    end
                end
            end
        else
            minetest.node_dig(pos, node, digger)
        end
    end
})

minetest.register_node("nssw:thick_web", {
    description = "Thick Web",
    inventory_image = "thick_web.png",
    tiles = {"thick_web.png"} ,
    drawtype = "firelike",
    paramtype = "light",
    walkable = false,
    pointable = true,
    diggable = true,
    buildable_to = false,
    drop = "farming:cotton 8",
    drowning = 2,
    liquid_renewable = false,
    liquidtype = "source",
    liquid_range= 0,
    liquid_alternative_flowing = "nssw:thick_web",
    liquid_alternative_source = "nssw:thick_web",
    liquid_viscosity = 30,
    groups = {flammable=2, snappy=1, liquid=1},
})

minetest.register_node("nssw:ink", {
    description = "Ink",
    inventory_image = minetest.inventorycube("ink.png"),
    drawtype = "liquid",
    tiles = {
        {
            name = "ink_animated.png",
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 2.0,
            },
        },
    },
    --alpha = 420,
    paramtype = "light",
    walkable = false,
    pointable = false,
    diggable = false,
    buildable_to = true,
    is_ground_content = false,
    drop = "",
    liquid_range= 0,
    drowning = 1,
    liquid_renewable = false,
    liquidtype = "source",
    liquid_alternative_flowing = "nssw:ink",
    liquid_alternative_source = "nssw:ink",
    liquid_viscosity = 1,
    post_effect_color = {a=2000, r=30, g=30, b=30},
    groups = {water=3, liquid=3, puts_out_fire=1},
})

minetest.register_node("nssw:mese_meteor", {
    description = "Mese Meteor",
    tiles = {"mese_meteor.png"} ,
    paramtype = "light",
    drop = "",
    groups = {crumbly=1, falling_node=1, flammable = 2},
})

minetest.register_node("nssw:pumpbomb", {
    tiles = {"pumpbomb_top.png","pumpbomb_bottom.png", "pumpbomb_side.png", "pumpbomb_side.png", "pumpbomb_side.png", "pumpbomb_front.png"},
    light_source = 5,
    groups = {not_in_creative_inventory =1},
    drop = "",
    on_timer = function(pos, elapsed)
        tnt_boom_nssw(pos, {damage_radius=4,radius=3,ignore_protection=false})
        minetest.env:set_node(pos, {name="air"})
    end,
})

minetest.register_node("nssw:dragons_mese", {
    description = "Mese Dragon's Touch",
    tiles = {"default_mese_block.png"},
    paramtype = "light",
    drop = "default:mese_crystal",
    groups = {cracky = 3, level = 2},
    sounds = default.node_sound_stone_defaults(),
    light_source = 7,
})

minetest.register_node("nssw:phoenix_fire", {
    description = "Phoenix Fire",
    drawtype = "firelike",
    tiles = {{
        name = "phoenix_fire_animated.png",
        animation = {type = "vertical_frames",
            aspect_w = 16, aspect_h = 16, length = 1},
    }},
    inventory_image = "phoenix_fire.png",
    light_source = LIGHT_MAX,
    -- groups = {igniter = 1, snappy=1},
    groups = {snappy=1},
    drop = '',
    walkable = false,
    buildable_to = false,
    damage_per_second = 4,
})



--recipes

minetest.register_craft({
    output = 'nssw:web_string',
    recipe = {
        {'nssw:web', 'nssw:web'},
        {'nssw:web', 'nssw:web'},
    }
})

minetest.register_craft({
    output = 'nssw:dense_web_string',
    recipe = {
        {'nssw:web_string', 'nssw:web_string', 'nssw:web_string'},
        {'nssw:web_string', 'nssw:web_string', 'nssw:web_string'},
        {'nssw:web_string', 'nssw:web_string', 'nssw:web_string'},
    }
})

minetest.register_craft({
    output = 'nssw:mantis_sword',
    recipe = {
        {'nssw:mantis_claw'},
        {'nssw:mantis_claw'},
        {'group:stick'},
    }
})

minetest.register_craft({
    output = 'nssw:masticone_fang_sword',
    recipe = {
        {'nssw:masticone_fang', 'nssw:masticone_fang'},
        {'nssw:masticone_fang', ''},
        {'group:stick', ''},
    }
})

minetest.register_craft({
    output = 'nssw:black_ice_tooth',
    type = "shapeless",
    recipe = {'nssw:digested_sand', 'nssw:ice_tooth'},
})

minetest.register_craft({
    output = 'nssw:web 4',
    type = "shapeless",
    recipe = {'nssw:silk_gland'},
})

minetest.register_craft({
    output = 'nssw:crab_light_mace',
    recipe = {
        {'nssw:crab_chela'},
        {'group:stick'},
        {'group:stick'},
    }
})

minetest.register_craft({
    output = 'nssw:crab_heavy_mace',
    recipe = {
        {'', 'nssw:crab_chela', ''},
        {'nssw:crab_chela', 'nssw:crab_chela', 'nssw:crab_chela'},
        {'', 'group:stick', ''},
    }
})

minetest.register_craft({
    output = 'nssw:mese_egg',
    type = "shapeless",
    recipe = {'nssw:tarantula_chelicerae', 'nssw:helmet_masticone_crowned', 'nssw:eyed_tentacle','nssw:black_ice_tooth', 'nssw:superior_energy_globe', 'nssw:sky_feather','nssw:cursed_pumpkin_seed', 'nssw:ant_queen_abdomen', 'nssw:snake_scute'}
})

minetest.register_craft({
    output = 'nssw:eyed_tentacle',
    type = "shapeless",
    recipe = {'nssw:lava_titan_eye','nssw:tentacle_curly'}
})

--[[
minetest.register_craft({
    output = 'nssw:masticone_skull',
    recipe = {
        {'nssw:masticone_skull_fragments', 'nssw:masticone_skull_fragments', 'nssw:masticone_skull_fragments'},
        {'nssw:masticone_skull_fragments', 'nssw:masticone_skull_fragments', 'nssw:masticone_skull_fragments'},
        {'nssw:masticone_skull_fragments', 'nssw:masticone_skull_fragments', 'nssw:masticone_skull_fragments'},
    }
})]]

minetest.register_craft({
    output = 'nssw:rope 12',
    recipe = {
        {'nssw:web_string'},
        {'nssw:web_string'},
        {'nssw:web_string'},
    }
})

minetest.register_craft({
    output = 'nssw:sky_feather',
    type = "shapeless",
    recipe = {'nssw:sun_feather','nssw:night_feather'}
})

minetest.register_craft({
    output = 'nssw:sun_sword',
    recipe = {
        {'default:diamond'},
        {'nssw:sun_feather'},
        {'group:stick'},
    }
})

minetest.register_craft({
    output = 'nssw:night_sword',
    recipe = {
        {'default:diamond'},
        {'nssw:night_feather'},
        {'group:stick'},
    }
})



minetest.register_craft({
    output = 'nssw:larva_juice',
    type = "shapeless",
    recipe = {'nssw:larva_meat','bucket:bucket_empty'}
})

minetest.register_craft({
    output = 'nssw:ant_sword',
    recipe = {
        {'nssw:ant_mandible'},
        {'nssw:ant_mandible'},
        {'group:stick'},
    }
})

minetest.register_craft({
    output = 'nssw:ant_billhook',
    recipe = {
        {'nssw:ant_mandible', 'nssw:ant_mandible'},
        {'nssw:ant_mandible', 'group:stick'},
        {'', 'group:stick'},
    }
})

minetest.register_craft({
    output = 'nssw:ant_shovel',
    recipe = {
        {'nssw:ant_mandible'},
        {'group:stick'},
        {'group:stick'},
    }
})

minetest.register_craft({
    output = 'nssw:duck_beak_shovel',
    recipe = {
        {'nssw:duck_beak'},
        {'group:stick'},
        {'group:stick'},
    }
})

minetest.register_craft({
    output = 'nssw:duck_beak_pick',
    recipe = {
        {'nssw:duck_beak', 'nssw:duck_beak', 'nssw:duck_beak'},
        {'', 'group:stick', ''},
        {'', 'group:stick', ''},
    }
})

minetest.register_craft({
    output = 'nssw:sky_iron 30',
    recipe = {
        {'default:steelblock', 'default:steelblock', 'default:steelblock'},
        {'default:steelblock', 'nssw:sky_feather', 'default:steelblock'},
        {'default:steelblock', 'default:steelblock', 'default:steelblock'},
    }
})

minetest.register_craft({
    output = 'nssw:stoneater_pick',
    recipe = {
        {'nssw:stoneater_mandible', 'nssw:stoneater_mandible', 'nssw:stoneater_mandible'},
        {'', 'group:stick', ''},
        {'', 'group:stick', ''},
    }
})

minetest.register_craft({
    output = 'nssw:felucco_knife',
    recipe = {
        {'nssw:felucco_horn'},
        {'group:stick'},
    }
})

minetest.register_craft({
    output = 'nssw:little_ice_tooth_knife',
    recipe = {
        {'nssw:little_ice_tooth'},
        {'group:stick'},
    }
})

minetest.register_craft({
    output = 'nssw:manticore_spine_knife',
    recipe = {
        {'nssw:manticore_spine'},
        {'group:stick'},
    }
})

minetest.register_craft({
    output = 'nssw:ant_pick',
    recipe = {
        {'nssw:ant_mandible', 'nssw:ant_mandible', 'nssw:ant_mandible'},
        {'', 'group:stick', ''},
        {'', 'group:stick', ''},
    }
})

minetest.register_craft({
    output = 'nssw:mantis_pick',
    recipe = {
        {'nssw:mantis_claw', 'nssw:mantis_claw', 'nssw:mantis_claw'},
        {'', 'group:stick', ''},
        {'', 'group:stick', ''},
    }
})

minetest.register_craft({
    output = 'nssw:mantis_axe',
    recipe = {
        {'nssw:mantis_claw', 'nssw:mantis_claw'},
        {'nssw:mantis_claw', 'group:stick'},
        {'', 'group:stick'},
    }
})

minetest.register_craft({
    output = 'nssw:tarantula_warhammer',
    recipe = {
        {'nssw:tarantula_chelicerae'},
        {'group:stick'},
        {'group:stick'},
    }
})

minetest.register_craft({
    output = 'nssw:mantis_battleaxe',
    recipe = {
        {'nssw:mantis_claw', 'nssw:mantis_claw', 'nssw:mantis_claw'},
        {'nssw:mantis_claw', 'group:stick', 'nssw:mantis_claw'},
        {'', 'group:stick', ''},
    }
})
--Eggs

function nssw_register_egg (name, descr)
    minetest.register_craftitem("nssw:".. name, {
        description = descr .. " Egg",
        image = name.."_egg.png",
        on_place = function(itemstack, placer, pointed_thing)
            local pos1=minetest.get_pointed_thing_position(pointed_thing, true)
            pos1.y=pos1.y+1.5
            core.after(0.1, function()
                minetest.add_entity(pos1, "nssw:".. name)
            end)
            itemstack:take_item()
            return itemstack
        end,
    })
end

function nssw_register_egg2 (name, descr)                --mobs you can't catch
    minetest.register_craftitem("nssw:".. name.."_egg", {
        description = descr .. " Egg",
        image = name.."_egg.png",
        on_place = function(itemstack, placer, pointed_thing)
            local pos1=minetest.get_pointed_thing_position(pointed_thing, true)
            pos1.y=pos1.y+1.5
            core.after(0.1, function()
                minetest.add_entity(pos1, "nssw:".. name)
            end)
            itemstack:take_item()
            return itemstack
        end,
    })
end

nssw_register_egg ('flying_duck', 'Flying Duck')
nssw_register_egg ('stone_eater', 'Stoneater')
nssw_register_egg ('signosigno', 'Signosigno')
nssw_register_egg ('bloco', 'Bloco')
nssw_register_egg ('sand_bloco', 'Sand Bloco')
nssw_register_egg ('swimming_duck', 'Swimming Duck')
nssw_register_egg ('duck', 'Duck')
nssw_register_egg2 ('duckking', 'Duckking')
nssw_register_egg ('enderduck', 'Enderduck')
nssw_register_egg ('spiderduck', 'Spiderduck')
nssw_register_egg2 ('echidna', 'Echidna')
nssw_register_egg ('werewolf', 'Werewolf')
nssw_register_egg ('white_werewolf', 'White Werewolf')
nssw_register_egg ('snow_biter', 'Snow Biter')
nssw_register_egg2 ('icelamander', 'Icelamander')
nssw_register_egg ('icesnake', 'Icesnake')
nssw_register_egg2 ('lava_titan', 'Lava Titan')
nssw_register_egg ('masticone', 'Masticone')
nssw_register_egg ('mantis_beast', 'Mantis Beast')
nssw_register_egg ('mantis', 'Mantis')
nssw_register_egg ('larva', 'Larva')
nssw_register_egg2 ('phoenix', 'Phoenix')
nssw_register_egg2 ('night_master', 'Night Master')
nssw_register_egg ('scrausics', 'Scrausics')
nssw_register_egg ('moonheron', 'Moonheron')
nssw_register_egg ('sandworm', 'Sandworm')
nssw_register_egg2 ('giant_sandworm', 'Giant Sandworm')
nssw_register_egg2 ('ant_queen', 'Ant Queen')
nssw_register_egg ('ant_soldier', 'Ant Soldier')
nssw_register_egg ('ant_worker', 'Ant Worker')
nssw_register_egg ('crocodile', 'Crocodile')
nssw_register_egg ('dolidrosaurus', 'Dolidrosaurus')
nssw_register_egg ('crab', 'Crab')
nssw_register_egg ('octopus', 'Octopus')
nssw_register_egg ('xgaloctopus', 'Xgaloctopus')
nssw_register_egg ('black_widow', 'Black Widow')
nssw_register_egg ('uloboros', 'Uloboros')
nssw_register_egg2 ('tarantula', 'Tarantula')
nssw_register_egg ('daddy_long_legs', 'Daddy Long Legs')
nssw_register_egg2 ('kraken', 'Kraken')
nssw_register_egg2 ('pumpking', 'Pumpking')
nssw_register_egg ('manticore', 'Manticore')
nssw_register_egg ('felucco', 'Felucco')
nssw_register_egg ('pumpboom_large', 'Large Pumpboom')
nssw_register_egg ('pumpboom_small', 'Small Pumpboom')
nssw_register_egg ('pumpboom_medium', 'Medium Pumpboom')
nssw_register_egg2 ('mordain', 'Mordain')
nssw_register_egg2 ('morgre', 'Morgre')
nssw_register_egg2 ('morvy', 'Morvy')
nssw_register_egg2 ('morgut', 'Morgut')
nssw_register_egg2 ('morde', 'Morde')
nssw_register_egg2 ('morlu', 'Morlu')
nssw_register_egg2 ('morwa', 'Morwa')
nssw_register_egg ('morvalar', 'Morvalar')

minetest.register_craftitem("nssw:mese_egg", {
    description = "Mese Egg",
    image = "mese_egg.png",
    on_place = function(itemstack, placer, pointed_thing)
        local pos1=minetest.get_pointed_thing_position(pointed_thing, true)
        pos1.y=pos1.y+1.5
        minetest.add_particlespawner({
            amount = 1000,
            time = 0.2,
            minpos = {x=pos1.x-1, y=pos1.y-1, z=pos1.z-1},
            maxpos = {x=pos1.x+1, y=pos1.y+4, z=pos1.z+1},
            minvel = {x=0, y=0, z=0},
            maxvel = {x=1, y=5, z=1},
            minacc = {x=-0.5,y=5,z=-0.5},
            maxacc = {x=0.5,y=5,z=0.5},
            minexptime = 1,
            maxexptime = 3,
            minsize = 2,
            maxsize = 4,
            collisiondetection = false,
            vertical = false,
            texture = "tnt_smoke.png",
        })
        core.after(0.4, function()
            minetest.add_entity(pos1, "nssw:mese_dragon")
        end)
        itemstack:take_item()
        return itemstack
    end,
})


--experimental morwa statue
minetest.register_node("nssw:morwa_statue", {
    description = 'Morwa Statue',
    drawtype = 'mesh',
    mesh = 'morwa_statue.b3d',
    tiles = {'morwa_statue.png'},
    inventory_image = 'morwa_statue.png',
    groups = {not_in_creative_inventory=1},
    paramtype = 'light',
    paramtype2 = 'facedir',
    selection_box = {
      type = 'fixed',
      fixed = {-1, -0.5, -1, 1, 3, 1}, -- Right, Bottom, Back, Left, Top, Front
    },
    collision_box = {
      type = 'fixed',
      fixed = {-1, -0.5, -1, 1, 3, 1}, -- Right, Bottom, Back, Left, Top, Front
    },
})
