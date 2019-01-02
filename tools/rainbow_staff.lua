-- The Rainbow Staff is a reward for defeating the final boss
-- Classic implementation produces Nyancat rainbow blocks in any direction it is pointed at and used
-- This tends to be problematic on servers, so is replaced with a powerful tool instead
--  if server_rainbow_staff is enabled

-- The `nyancat` mod was removed in Minetest 0.4.16+
-- The alternative blocks are used when this mod is not/no longer present

local head_block = "nyancat:nyancat"
local tail_block = "nyancat:nyancat_rainbow"

local head_replacement = "nssm:great_energy_globe"
local tail_replacement = "nssm:superior_energy_globe"

if not nssm.energy_lights then
    head_replacement = "nssm:modders_block"
    tail_replacement = "nssm:invisible_light"
end

if not nssm.server_rainbow_staff then
    local max_rainbow_time = 5

    if not minetest.registered_nodes["nyancat:nyancat_rainbow"] then
        minetest.register_alias(head_block, head_replacement)
        minetest.register_alias(tail_block, tail_replacement)
        head_block = head_replacement
        tail_block = tail_replacement
        print("NYARRWRW !!!")
    else
        print("NYAN !!!")
    end

    minetest.register_entity("nssm:rainbow", {
        textures = {"transparent.png"},
        velocity = 10,
        hp_max = 50,
        on_step = function (self, pos, node, dtime)
            self.timer = self.timer or os.time()

            local pos = self.object:getpos()
            if minetest.is_protected(pos, "") then
                return
            end

            if os.time() - self.timer > max_rainbow_time then
                minetest.set_node(pos, {name=head_block})
                self.object:remove()
            end

            if minetest.get_node(pos) then
                local n = minetest.get_node(pos).name
                if n ~= tail_block then
                    if n=="air" then
                        minetest.set_node(pos, {name=tail_block})
                    else
                        minetest.set_node(pos, {name=head_block})
                        self.object:remove()
                    end
                end
            end
        end
    })

    minetest.register_tool("nssm:rainbow_staff", {
        description = "Rainbow Staff",
        inventory_image = "rainbow_staff.png",
        on_use = function(itemstack, placer, pointed_thing)
            local dir = placer:get_look_dir();
            local playerpos = placer:getpos();
            local obj = minetest.add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+2+dir.y,z=playerpos.z+0+dir.z}, "nssm:rainbow")
            local vec = {x=dir.x*6,y=dir.y*6,z=dir.z*6}
            obj:setvelocity(vec)
            return itemstack
        end,
        groups = {not_in_creative_inventory=1,}
    })


else
    minetest.register_tool("nssm:rainbow_staff", {
        description = "Rainbow Tool",
        inventory_image = "rainbow_staff.png",
        tool_capabilities = {
            full_punch_interval = 0.2,
            max_drop_level=1,
            groupcaps={
                snappy={times={[1]=0.80, [2]=0.40, [3]=0.20},  uses=300, maxlevel=4},
                crumbly={times={[1]=0.80, [2]=0.40, [3]=0.20}, uses=300, maxlevel=4},
                choppy={times={[1]=0.80, [2]=0.40, [3]=0.20},  uses=300, maxlevel=4},
                cracky={times={[1]=0.80, [2]=0.40, [3]=0.20},  uses=300, maxlevel=4},
                fleshy={times={[1]=0.80, [2]=0.60, [3]=0.20},  uses=220, maxlevel=4}
            },
            -- Ignores armor ?
            damage_groups = {fleshy=20}, 
        },

        groups = {not_in_creative_inventory=1,}
    })
end
