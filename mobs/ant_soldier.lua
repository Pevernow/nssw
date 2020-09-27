nssw:register_mob("nssw:ant_soldier", "Ant Soldier", {
    type = "monster",
    hp_max = 32,
    hp_min = 24,
    collisionbox = {-0.49, 0.00, -0.49, 0.49, 0.9, 0.49},
    visual = "mesh",
    mesh = "ant_soldier.x",
    textures = {{"ant_soldier.png"}},
    visual_size = {x=3, y=3},
    makes_footstep_sound = true,
    view_range = 20,
    fear_height = 4,
    walk_velocity = 0.5,
    run_velocity = 3,
    rotate = 270,
    sounds = {
        random = "ant",
    },
    damage = 6,
    jump = true,
    drops = {
        {name = "nssw:life_energy",
        chance = 1,
        min = 1,
        max = 2,},
        {name = "nssw:ant_leg",
        chance = 2,
        min = 1,
        max = 6,},
        {name = "nssw:ant_mandible",
        chance = 3,
        min = 1,
        max = 2,},
        {name = "nssw:ant_hard_skin",
        chance = 3,
        min = 1,
        max = 2,},
    },
    reach = 2,
    armor = 70,
    drawtype = "front",
    water_damage = 2,
    lava_damage = 7,
    light_damage = 0,
    on_rightclick = nil,
    group_attack=true,
    attack_animals=false,
    knock_back=2,
    blood_texture="nssw_blood_blue.png",
    stepheight=1.1,
    attack_type = "dogfight",
    animation = {
        speed_normal = 20,
        speed_run = 35,
        stand_start = 1,
        stand_end = 60,
        walk_start = 90,
        walk_end = 130,
        run_start = 90,
        run_end = 130,
        punch_start = 60,
        punch_end = 80,
    },
})
