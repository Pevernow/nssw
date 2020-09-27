function nssw_register_evocation (evomob, evodescr, numbe, evomob_ingredient)
    nssw_register_throwegg(evomob, evodescr.." Bomb", {
        hit_node = function(self,pos)
                        local pos1 = {x = pos.x, y=pos.y+1, z=pos.z}
                        if not minetest.is_protected(pos1, "") or not minetest.get_item_group(minetest.get_node(pos1).name, "unbreakable") == 1 then
                           for n=1,numbe do
                                minetest.add_entity(pos1, "nssw:".. evomob)
                           end
                        end
        end,
    })

    minetest.register_craft({
        output = 'nssw:'..evomob.."_bomb",
        type = "shapeless",
        recipe = {'nssw:empty_evocation_bomb', 'nssw:'..(evomob_ingredient or evomob)},

    })
end

nssw_register_evocation ("duck","Duck Evocation", 4)
nssw_register_evocation ("bloco","Bloco Evocation", 3)
nssw_register_evocation ("enderduck","Enderduck Evocation", 2)
nssw_register_evocation ("flying_duck","Flying Duck Evocation", 3)
nssw_register_evocation ("swimming_duck","Swimming Duck Evocation", 3)
nssw_register_evocation ("duckking","Duckking Evocation", 1, "duckking_egg")
nssw_register_evocation ("spiderduck","Spiderduck Evocation", 2)

