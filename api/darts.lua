-- arrow (duck_arrow)
mobs:register_arrow("nssw:duck_father", {
    visual = "sprite",
    visual_size = {x = 1, y = 1},
    textures = {"duck_egg.png"},
    velocity = 8,
    -- direct hit
    hit_player = function(self, player)
        local pos = self.object:getpos()
        duck_explosion(pos)
    end,

    hit_mob = function(self, player)
        local pos = self.object:getpos()
        duck_explosion(pos)
    end,

    hit_node = function(self, pos, node)
        duck_explosion(pos)
    end,

})

function duck_explosion(pos)
    if minetest.is_protected(pos, "") then
        return
    end
    pos.y = pos.y+1;
    minetest.add_particlespawner({
        amount = 10,
        time = 0.2,
        minpos = {x=pos.x-1, y=pos.y-1, z=pos.z-1},
        maxpos = {x=pos.x+1, y=pos.y+4, z=pos.z+1},
        minvel = {x=0, y=0, z=0},
        maxvel = {x=1, y=1, z=1},
        minacc = {x=-0.5,y=5,z=-0.5},
        maxacc = {x=0.5,y=5,z=0.5},
        minexptime = 1,
        maxexptime = 3,
        minsize = 4,
        maxsize = 6,
        collisiondetection = false,
        vertical = false,
        texture = "duck_egg_fragments.png",
    })
    core.after(0.4, function()
        for dx = -1,1 do
            pos = {x = pos.x+dx, y=pos.y; z=pos.z+dx}
            minetest.add_particlespawner({
                amount = 100,
                time = 0.2,
                minpos = {x=pos.x-1, y=pos.y-1, z=pos.z-1},
                maxpos = {x=pos.x+1, y=pos.y+4, z=pos.z+1},
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
            minetest.add_entity(pos, "nssw:duck")
        end
    end)
end

-- snow_arrow
mobs:register_arrow("nssw:snow_arrow", {
    visual = "sprite",
    visual_size = {x = 1, y = 1},
    textures = {"transparent.png"},
    velocity =20,
    -- direct hit
    hit_player = function(self, player)
        local pos = self.object:getpos()
        ice_explosion(pos)
    end,

    hit_mob = function(self, player)
        local pos = self.object:getpos()
        ice_explosion(pos)
    end,
    hit_node = function(self, pos, node)
        ice_explosion(pos)
    end,
})

function ice_explosion(pos)
    for i=pos.x-math.random(0, 1), pos.x+math.random(0, 1), 1 do
        for j=pos.y-1, pos.y+4, 1 do
            for k=pos.z-math.random(0, 1), pos.z+math.random(0, 1), 1 do
                local p = {x=i, y=j, z=k}
                local n = minetest.env:get_node(p).name
                if not nssw.unswappable_node(p) then
                    minetest.set_node(p, {name="default:ice"})
                end
            end
        end
    end
end

-- arrow manticore
mobs:register_arrow("nssw:spine", {
    visual = "sprite",
    visual_size = {x = 1, y = 1},
    textures = {"manticore_spine_flying.png"},
    velocity = 10,
    -- direct hit
    hit_player = function(self, player)
        player:punch(self.object, 1.0, {
            full_punch_interval = 1.0,
            damage_groups = {fleshy = 2},
        }, nil)
    end,

    hit_mob = function(self, player)
        player:punch(self.object, 1.0, {
            full_punch_interval = 1.0,
            damage_groups = {fleshy = 2},
        }, nil)
    end,
    hit_node = function(self, pos, node)
    end
})

--morbat arrow
mobs:register_arrow("nssw:morarrow", {
    visual = "sprite",
    visual_size = {x=0.5, y=0.5},
    textures = {"morarrow.png"},
    velocity= 13,

    hit_player = function(self, player)
        player:punch(self.object, 1.0, {
            full_punch_interval = 1.0,
            damage_groups = {fleshy = 3},
        }, nil)
    end,
    hit_node = function(self, pos, node)
    end
})

-- web arrow
mobs:register_arrow("nssw:webball", {
    visual = "sprite",
    visual_size = {x = 1, y = 1},
    textures = {"web_ball.png"},
    velocity = 8,
    -- direct hit
    hit_player = function(self, player)
        local p = player:getpos()
        explosion_web(p, "nssw:web")
    end,

    hit_mob = function(self, player)
        player:punch(self.object, 1.0, {
            full_punch_interval = 1.0,
            damage_groups = {fleshy = 1},
        }, nil)
    end,

    hit_node = function(self, pos, node)
        explosion_web(pos, "nssw:web")
    end
})

function explosion_web(pos, webtype)
    pos.y = round(pos.y)
    for i=pos.x-1, pos.x+1, 1 do
        for j=pos.y-3, pos.y, 1 do
            for k=pos.z-1, pos.z+1, 1 do
                -- TODO 0 check, why are we operating on two positions?
                local p = {x=i,y=j,z=k}
                local k = {x=i,y=j+1,z=k}
                local current = minetest.env:get_node(p).name
                local ontop  = minetest.env:get_node(k).name
                if current == "air" then
                --if not nssw.unswappable_node(p) then -- replaces to many nodes
                    minetest.set_node(p, {name=webtype})
                end
            end
        end
    end
end


-- thick_web arrow
mobs:register_arrow("nssw:thickwebball", {
    visual = "sprite",
    visual_size = {x = 2, y = 2},
    textures = {"thick_web_ball.png"},
    velocity = 8,
    -- direct hit
    hit_player = function(self, player)
        local p = player:getpos()
        explosion_web(p, "nssw:thick_web")
    end,

    hit_mob = function(self, player)
        player:punch(self.object, 1.0, {
            full_punch_interval = 1.0,
            damage_groups = {fleshy = 6},
        }, nil)
    end,

    hit_node = function(self, pos, node)
        explosion_web(pos, "nssw:thick_web")
    end
})

-- arrow=>phoenix arrow
mobs:register_arrow("nssw:phoenix_arrow", {
    visual = "sprite",
    visual_size = {x = 1, y = 1},
    textures = {"transparent.png"},
    velocity = 8,
    -- direct hit
    hit_player = function(self, player)
    end,

    on_step = function(self, dtime)

        local pos = self.object:getpos()
        if minetest.is_protected(pos, "") then
            return
        end

        local n = minetest.env:get_node(pos).name

        if self.timer == 0 then
            self.timer = os.time()
        end

        -- If arrow has hit node, protected space, or is aged out
        if os.time() - self.timer > 5 or minetest.is_protected(pos, "") or ((n~="air") and (n~="nssw:phoenix_fire")) then
            self.object:remove()
        end

        -- Randomly decide to place phoenix fire at current location
        if math.random(1,2)==2 then
            if not nssw.unswappable_node(pos) then
                minetest.env:set_node(pos, {name="nssw:phoenix_fire"})
            end
        end

        -- Randomly decide to ignote neighbouring nodes
        if math.random(1,6)==1 then
            dx = math.random(-1,1)
            dy = math.random(-1,1)
            dz = math.random(-1,1)
            local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
            local n = minetest.env:get_node(p).name
            if n=="air" and not nssw.unswappable_node(p) then
                minetest.env:set_node(p, {name="nssw:phoenix_fire"})
            end
        end

    end,
    hit_node = function(self, pos, node)
    end
})

mobs:register_arrow("nssw:super_gas", {
    visual = "sprite",
    visual_size = {x = 1, y = 1},
    textures = {"tnt_smoke.png^[colorize:green:170"},
    velocity = 8,
    -- direct hit
    hit_player = function(self, player)
        local p = player:getpos()
        gas_explosion(p)
    end,

    hit_node = function(self, pos, node)
        gas_explosion(pos)
    end
})


function gas_explosion(pos)
    if minetest.is_protected(pos, "") then
        return
    end
    for dx=-2,2 do
        for dy=-1,4 do
            for dz=-2,2 do
                local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
                if minetest.is_protected(p, "") then
                    return
                end
                local n = minetest.env:get_node(p).name
                if n == "air" and not nssw.unswappable_node(p) then
                    minetest.set_node(p, {name="nssw:venomous_gas"})
                end
            end
        end
    end
end

--
mobs:register_arrow("nssw:roar_of_the_dragon", {
    visual = "sprite",
    visual_size = {x = 1, y = 1},
    textures = {"transparent.png"},
    velocity = 10,

    on_step = function(self, dtime)

        local pos = self.object:getpos()

        local n = minetest.env:get_node(pos).name

        if self.timer == 0 then
            self.timer = os.time()
        end

        if os.time() - self.timer > 8 or minetest.is_protected(pos, "") then
            self.object:remove()
        end

        local objects = minetest.env:get_objects_inside_radius(pos, 1)
        for _,obj in ipairs(objects) do
            local name = obj:get_entity_name()
            if name ~= "nssw:roar_of_the_dragon" and name ~= "nssw:mese_dragon" then
                obj:set_hp(obj:get_hp()-0.05)
                if (obj:get_hp() <= 0) then
                    if (not obj:is_player()) and name ~= self.object:get_luaentity().name then
                        obj:remove()
                    end
                end
            end
        end

        minetest.env:set_node(pos, {name="air"})
        if math.random(1,2)==1 then
            dx = math.random(-1,1)
            dy = math.random(-1,1)
            dz = math.random(-1,1)
            if minetest.is_protected(p, "") then
                return
            end
            local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
            minetest.env:set_node(p, {name="air"})
        end
    end
})


mobs:register_arrow("nssw:lava_arrow", {
    visual = "sprite",
    visual_size = {x = 1, y = 1},
    textures = {"transparent.png"},
    velocity = 10,
    -- direct hit
    hit_player = function(self, player)
        local pos = self.object:getpos()
        if minetest.is_protected(pos, "") then
            return
        end
        for dy=-1, 6, 1 do
            for dx=-1, 1, 2 do
                for dz=-1, 1, 2 do
                    local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
                    local n = minetest.env:get_node(p).name
                    if n~="default:lava_flowing" and not nssw.unswappable_node(p) then
                        minetest.set_node(p, {name="default:lava_flowing"})
                    end
                end
            end
        end
    end,
    hit_node = function(self, pos, node)
    end
})
