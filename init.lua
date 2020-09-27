nssw = {
    version = "20190117",
    maintainer = "pevernow", -- change if forking project
    S = minetest.get_translator("nssw")
}

-- Pre-check compatibility
--  Downloaded

local mobs_version_required = 20181220

if mobs then
    if not (mobs.version and tonumber(mobs.version) > mobs_version_required) then
        minetest.log("error",
            "Incompatible mobs library (version "..
            tostring(mobs.version)..
            ") loaded. Please use a recent mobs_redo (newer than"..
            mobs_version_required..")"
        )
        os.exit(1) -- Bail early, mainly for servers.
    end
else
    minetest.log("error", "No mobs engine detected. Please use mobs_redo -> https://tinyurl.com/mt-mobs-redo .")
    os.exit(1)
end

-- File loading
nssw.path = minetest.get_modpath("nssw")

function nssw:load(filepath)
    dofile(nssw.path.."/"..filepath)
end

-- Load before all others
nssw:load("api/settings.lua")

-- General API
nssw:load("api/main_api.lua")
nssw:load("api/darts.lua")
nssw:load("api/abms.lua")

--Mobs

nssw:load("mobs/all_mobs.lua")
nssw:load("mobs/spawn.lua")

-- Items etc

nssw:load("materials/materials.lua")

nssw:load("tools/basic.lua")
nssw:load("tools/moranga_tools.lua")
nssw:load("tools/spears.lua")
nssw:load("tools/weapons.lua")
nssw:load("tools/bomb_materials.lua")
nssw:load("tools/bomb_evocation.lua")
nssw:load("tools/rainbow_staff.lua")
nssw:load("tools/armor.lua")
