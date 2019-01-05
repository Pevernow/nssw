function nssm:register_noneatcraftitems (name, descr)
    minetest.register_craftitem("nssm:"..name, {
        description = descr,
        image = name..".png",
    })
end

function nssm:register_eatcraftitems (name, descr, gnam)
    minetest.register_craftitem("nssm:"..name, {
        description = descr,
        image = name..".png",
        on_use = minetest.item_eat(gnam),
        groups = { meat=1, eatable=1 },
    })
end

function nssm_register_recipe (ingredient, dish, tictac)
    minetest.register_craft({
        type = "cooking",
        output = "nssm:"..dish,
        recipe = "nssm:"..ingredient,
        cooktime = tictac,
    })
end

-- Materials

nssm:register_noneatcraftitems ('sky_feather','Sky Feather')
nssm:register_noneatcraftitems ('snake_scute','Snake Scute')
nssm:register_noneatcraftitems ('eyed_tentacle','Eyed Tentacle')
nssm:register_noneatcraftitems ('ant_queen_abdomen',"Ant Queen's Abdomen")
nssm:register_noneatcraftitems ('masticone_skull_fragments','Masticone Skull Fragments')
nssm:register_noneatcraftitems ('tentacle_curly','Kraken Tentacle')
nssm:register_noneatcraftitems ('lava_titan_eye','Lava Titan Eye')
nssm:register_noneatcraftitems ('duck_beak','Duck Beak')
nssm:register_noneatcraftitems ('ice_tooth','Ice Tooth')
nssm:register_noneatcraftitems ('little_ice_tooth','Little Ice Tooth')
nssm:register_noneatcraftitems ('digested_sand',"Digested Sand")
nssm:register_noneatcraftitems ('black_ice_tooth','Black Ice Tooth')
nssm:register_noneatcraftitems ('tarantula_chelicerae','Tarantula Fangs')
nssm:register_noneatcraftitems ('crab_chela','Crab Claw')
nssm:register_noneatcraftitems ('cursed_pumpkin_seed','Cursed Pumpkin Seed')
nssm:register_noneatcraftitems ('mantis_claw','Mantis Claw')
nssm:register_noneatcraftitems ('manticore_fur','Manticore Fur')
nssm:register_noneatcraftitems ('ant_hard_skin','Ant Husk')
nssm:register_noneatcraftitems ('bloco_skin','Bloco Hide')
nssm:register_noneatcraftitems ('crab_carapace_fragment','Crab Shell Fragment')
nssm:register_noneatcraftitems ('crocodile_skin','Crocodile Hide')
nssm:register_noneatcraftitems ('manticore_spine','Manticore Spine')
nssm:register_noneatcraftitems ('night_feather','Night Feather')
nssm:register_noneatcraftitems ('sun_feather','Sun Feather')
nssm:register_noneatcraftitems ('duck_feather','Duck Feather')
nssm:register_noneatcraftitems ('black_duck_feather','Black Duck Feather')
nssm:register_noneatcraftitems ('masticone_fang','Masticone Fang')
nssm:register_noneatcraftitems ('white_wolf_fur','White Wolf Fur')
nssm:register_noneatcraftitems ('stoneater_mandible','Stoneater Mandible')
nssm:register_noneatcraftitems ('ant_mandible','Ant Mandible')
nssm:register_noneatcraftitems ('wolf_fur','Wolf Fur')
nssm:register_noneatcraftitems ('felucco_fur','Felucco Fur')
nssm:register_noneatcraftitems ('felucco_horn','Felucco Horn')
nssm:register_noneatcraftitems ('mantis_skin','Mantis Husk')
nssm:register_noneatcraftitems ('sand_bloco_skin','Sand Bloco Hide')
nssm:register_noneatcraftitems ('sandworm_skin','Sandworm Hide')
nssm:register_noneatcraftitems ('sky_iron','Sky Iron')
nssm:register_noneatcraftitems ('web_string','Cobweb String')
nssm:register_noneatcraftitems ('dense_web_string','Dense Cobweb String')
nssm:register_noneatcraftitems ('black_powder','Black Powder')
nssm:register_noneatcraftitems ('morelentir_dust','Soarkly Dark Stone Dust')
nssm:register_noneatcraftitems ('empty_evocation_bomb','Empty Summoning Bomb')

nssm:register_noneatcraftitems ('greedy_soul_fragment','Greedy Soul Fragment')
nssm:register_noneatcraftitems ('lustful_soul_fragment','Lustful Soul Fragment')
nssm:register_noneatcraftitems ('wrathful_soul_fragment','Wrathful Soul Fragment')
nssm:register_noneatcraftitems ('proud_soul_fragment','Proud Soul Fragment')
nssm:register_noneatcraftitems ('slothful_soul_fragment','Slothful Soul Fragment')
nssm:register_noneatcraftitems ('envious_soul_fragment','Envious Soul Fragment')
nssm:register_noneatcraftitems ('gluttonous_soul_fragment','Gluttonous Soul Fragment')
nssm:register_noneatcraftitems ('gluttonous_moranga','Gluttonous Moranga')
nssm:register_noneatcraftitems ('envious_moranga','Envious Moranga')
nssm:register_noneatcraftitems ('proud_moranga','Proud Moranga')
nssm:register_noneatcraftitems ('slothful_moranga','Slothful Moranga')
nssm:register_noneatcraftitems ('lustful_moranga','Lustful Moranga')
nssm:register_noneatcraftitems ('wrathful_moranga','Wrathful Moranga')
nssm:register_noneatcraftitems ('greedy_moranga','Greedy Moranga')

-- Food

nssm:register_eatcraftitems ('werewolf_leg','Werewolf Leg',3)
nssm:register_eatcraftitems ('felucco_steak','Felucco Steak',3)
nssm:register_eatcraftitems ('roasted_felucco_steak','Roasted Felucco Steak',6)
nssm:register_eatcraftitems ('heron_leg','Moonheron Leg',2)
nssm:register_eatcraftitems ('chichibios_heron_leg',"Chichibio's Moonheron Leg",4)
nssm:register_eatcraftitems ('crocodile_tail','Crocodile Tail',3)
nssm:register_eatcraftitems ('roasted_crocodile_tail','Roasted Crocodile Tail',6)
nssm:register_eatcraftitems ('roasted_werewolf_leg','Roasted_Werewolf Leg',6)
nssm:register_eatcraftitems ('duck_legs','Duck Legs',1)
nssm:register_eatcraftitems ('roasted_duck_legs','Roasted Duck Leg',3)
nssm:register_eatcraftitems ('ant_leg','Ant Leg',-1)
nssm:register_eatcraftitems ('roasted_ant_leg','Roasted Ant Leg',4)
nssm:register_eatcraftitems ('spider_leg','Spider Leg',-1)
nssm:register_eatcraftitems ('roasted_spider_leg','Roasted Spider Leg',4)
nssm:register_eatcraftitems ('brain','Brain',3)
nssm:register_eatcraftitems ('roasted_brain','Roasted Brain',8)
nssm:register_eatcraftitems ('tentacle','Tentacle',2)
nssm:register_eatcraftitems ('roasted_tentacle','Roasted Tentacle',5)
nssm:register_eatcraftitems ('worm_flesh','Worm Meat',-2)
nssm:register_eatcraftitems ('roasted_worm_flesh','Roasted Worm',4)
nssm:register_eatcraftitems ('amphibian_heart','Amphibian Heart',1)
nssm:register_eatcraftitems ('roasted_amphibian_heart','Roasted Amphibian Heart',8)
nssm:register_eatcraftitems ('raw_scrausics_wing','Raw Scrausics Wing',1)
nssm:register_eatcraftitems ('spicy_scrausics_wing','Spicy Scrausics Wing',6)
nssm:register_eatcraftitems ('phoenix_nuggets','Phoenix Nuggets',20)
nssm:register_eatcraftitems ('phoenix_tear','Phoenix Tear',20)
nssm:register_eatcraftitems ('frosted_amphibian_heart','Frosted Amphibian Heart',-1)
nssm:register_eatcraftitems ('surimi','Surimi',4)
nssm:register_eatcraftitems ('amphibian_ribs','Amphibian Ribs',2)
nssm:register_eatcraftitems ('roasted_amphibian_ribs','Roasted Amphibian Ribs',6)
nssm:register_eatcraftitems ('dolidrosaurus_fin','Dolidrosaurus Fin',-2)
nssm:register_eatcraftitems ('roasted_dolidrosaurus_fin','Roasted Dolidrosaurus Fin',4)
nssm:register_eatcraftitems ('larva_meat','Larva Meat',-1)
nssm:register_eatcraftitems ('larva_juice','Larva Juice',-3)
nssm:register_eatcraftitems ('larva_soup','Larva Soup',10)
nssm:register_eatcraftitems ('mantis_meat','Mantis Meat',1)
nssm:register_eatcraftitems ('roasted_mantis_meat','Roasted Mantis',4)
nssm:register_eatcraftitems ('spider_meat','Spider Meat',-1)
nssm:register_eatcraftitems ('roasted_spider_meat','Roasted Spider',3)
nssm:register_eatcraftitems ('silk_gland','Silk Gland',-1)
nssm:register_eatcraftitems ('roasted_silk_gland','Roasted Silk Gland',3)
nssm:register_eatcraftitems ('super_silk_gland','Super Silk Gland',-8)
nssm:register_eatcraftitems ('roasted_super_silk_gland','Roasted Super Silk Gland',2)

-- Cooking

nssm_register_recipe ('worm_flesh', 'roasted_worm_flesh', 12)
nssm_register_recipe ('duck_legs', 'roasted_duck_legs', 6)
nssm_register_recipe ('spider_leg', 'roasted_spider_leg', 6)
nssm_register_recipe ('felucco_steak', 'roasted_felucco_steak', 10)
nssm_register_recipe ('werewolf_leg', 'roasted_werewolf_leg', 10)
nssm_register_recipe ('brain', 'roasted_brain', 6)
nssm_register_recipe ('amphibian_heart', 'roasted_amphibian_heart', 6)
nssm_register_recipe ('tentacle', 'roasted_tentacle', 6)
nssm_register_recipe ('frosted_amphibian_heart', 'amphibian_heart', 8)
nssm_register_recipe ('heron_leg', 'chichibios_heron_leg', 20)
nssm_register_recipe ('raw_scrausics_wing', 'spicy_scrausics_wing', 12)
nssm_register_recipe ('ant_leg', 'roasted_ant_leg', 6)
nssm_register_recipe ('crocodile_tail', 'roasted_crocodile_tail', 16)
nssm_register_recipe ('dolidrosaurus_fin', 'roasted_dolidrosaurus_fin', 8)
nssm_register_recipe ('amphibian_ribs', 'roasted_amphibian_ribs', 12)
nssm_register_recipe ('mantis_meat', 'roasted_mantis_meat', 6)
nssm_register_recipe ('spider_meat', 'roasted_spider_meat', 6)
nssm_register_recipe ('silk_gland', 'roasted_silk_gland', 4)
nssm_register_recipe ('larva_juice', 'larva_soup', 20)