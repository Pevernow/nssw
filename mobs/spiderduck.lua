nssw:register_mob("nssw:spiderduck", "Spider-duck", {
    type = "monster",
    hp_max = 35,
    hp_min = 24,
    collisionbox = {-0.6, -0.8, -0.6, 0.6, 0.4, 0.5},
    visual = "mesh",
    rotate = 270,
    mesh = "spiderduck.x",
    textures = {{"spiderduck.png"}},
    visual_size = {x=2, y=2},
    fear_height = 4,
    makes_footstep_sound = true,
    view_range = 24,
    walk_velocity = 2,
    run_velocity = 4,
    sounds = {
        random = "duck",
    },
    damage = 6,
    jump = true,
    drops = {
        {name = "nssw:life_energy",
        chance = 1,
        min = 1,
        max = 2,},
        {name = "nssw:duck_legs",
        chance = 1,
        min = 1,
        max = 8,},
        {name = "nssw:silk_gland",
        chance = 2,
        min = 1,
        max = 2,},
        {name = "nssw:black_duck_feather",
        chance = 3,
        min = 1,
        max = 4,},
        {name = "nssw:duck_beak",
        chance = 5,
        min = 1,
        max = 1,},
    },
    armor = 80,
    drawtype = "front",
    water_damage = 2,
    lava_damage = 5,
    light_damage = 0,
    group_attack=true,
    attack_animals=true,
    knock_back=2,
    blood_texture="nssw_blood.png",
    stepheight=1.5,
    on_rightclick = nil,
    dogshoot_switch = true,
    attack_type = "dogshoot",
    arrow = "nssw:webball",
    reach = 2,
    shoot_interval = 5,
    shoot_offset = 2,
    animation = {
        speed_normal = 25,
        speed_run = 35,
        stand_start = 60,
        stand_end = 140,
        walk_start = 220,
        walk_end = 260,
        run_start = 220,
        run_end = 260,
        punch_start = 20,
        punch_end = 46,
        shoot_start = 150,
        shoot_end = 200,
    },
})
