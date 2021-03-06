--Gems by Vsevolod Borislav (wowiamdiamonds)
--
--License: WTFPL
--
--Depends: default, moreores
--
--Adds gems and encrusted tools
--

minetest.register_node("gems:mineral_garnet", {
	description = "Garnet",
	tiles = {"default_stone.png^gems_mineral_garnet.png"},
	is_ground_content = true,
	groups = {cracky=3},
	drop = 'gems:garnet',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("gems:mineral_aquamarine", {
	description = "Aquamarine",
	tiles = {"default_stone.png^gems_mineral_aquamarine.png"},
	is_ground_content = true,
	groups = {cracky=3},
	drop = 'gems:aquamarine',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("gems:mineral_topaz", {
	description = "Topaz",
	tiles = {"default_stone.png^gems_mineral_topaz.png"},
	is_ground_content = true,
	groups = {cracky=3},
	drop = 'gems:topaz',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("gems:mineral_diamond", {
	description = "Diamond",
	tiles = {"default_stone.png^gems_mineral_diamond.png"},
	is_ground_content = true,
	groups = {cracky=3},
	drop = 'gems:diamond',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("gems:mineral_opal", {
	description = "Opal",
	tiles = {"default_stone.png^gems_mineral_opal.png"},
	is_ground_content = true,
	groups = {cracky=3},
	drop = 'gems:opal',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("gems:garnet", {
	description = "Garnet",
	inventory_image = "gems_gem_garnet.png",
})
minetest.register_craftitem("gems:aquamarine", {
	description = "Aquamarine",
	inventory_image = "gems_gem_aquamarine.png",
})
minetest.register_craftitem("gems:topaz", {
	description = "Topaz",
	inventory_image = "gems_gem_topaz.png",
})
minetest.register_craftitem("gems:diamond", {
	description = "Diamond",
	inventory_image = "gems_gem_diamond.png",
})
minetest.register_craftitem("gems:opal", {
	description = "Opal",
	inventory_image = "gems_gem_opal.png",
})

encrust_a_tool = function(result,crafttool,craftgem)
	minetest.register_craft( {
       type = "shapeless",
       output = result,
       recipe = {
               crafttool,
               craftgem,
		},
	})
end

metal = {"steel","gold","mithril"}
formalmetal = {"Steel","Gold","Mithril"}
gem = {"garnet","aquamarine","topaz","diamond","opal"}

toolbenefit_one = {0.95,0.95,0.85,0.9,0.65}
toolbenefit_two = {1.05,1.1,1.05,1.15,0.9}

pickbases = {{4,1.6,1,10,2},{2,0.5,0.3,70,1},{2.25,0.55,0.35,200,1}}
axecbases = {{2,1.6,1,10,2},{1.7,0.4,0.35,70,1},{1.75,0.45,0.45,200,1}}
axefbases = {{0,1.1,0.6,40,1},{0,0.9,0.3,70,1},{0,0.95,0.3,200,1}}
shovelbases = {{1,0.7,0.6,10,2},{0.6,0.25,0.15,70,1},{0.7,0.35,0.2,200,1}}
swordfbases = {{2,0.8,0.4,10,2},{0,0.6,0.2,70,1},{0,0.65,0.25,200,1}}
swordsbases = {{0,0.7,0.3,40,1},{0,0.6,0.2,70,1},{0,0.7,0.25,200,1}}
swordcbases = {{0,0,0.7,40,0},{0,0,0.65,70,0},{0,0,0.65,200,0}}

for selgem = 1,5 do
	for selmat = 1,3 do
		if selmat == 1 then
			minetest.register_tool("gems:pick_"..metal[selmat].."_"..gem[selgem], {
				description = formalmetal[selmat].." Pickaxe ("..gem[selgem].." encrusted)",
				inventory_image = "gems_tool_pick_"..metal[selmat].."_"..gem[selgem]..".png",
				tool_capabilities = {
					max_drop_level=1,
					groupcaps={
						cracky={times={[1]=pickbases[selmat][1]*toolbenefit_one[selgem], [2]=pickbases[selmat][2]*toolbenefit_one[selgem], [3]=pickbases[selmat][3]*toolbenefit_one[selgem]}, uses=pickbases[selmat][4]*toolbenefit_two[selgem], maxlevel=pickbases[selmat][5]}
					}
				},
			})
			minetest.register_tool("gems:axe_"..metal[selmat].."_"..gem[selgem], {
				description = formalmetal[selmat].." Axe ("..gem[selgem].." encrusted)",
				inventory_image = "gems_tool_axe_"..metal[selmat].."_"..gem[selgem]..".png",
				tool_capabilities = {
					max_drop_level=1,
					groupcaps={
						choppy={times={[1]=axecbases[selmat][1]*toolbenefit_one[selgem], [2]=axecbases[selmat][2]*toolbenefit_one[selgem], [3]=axecbases[selmat][3]*toolbenefit_one[selgem]}, uses=axecbases[selmat][4]*toolbenefit_two[selgem], maxlevel=axecbases[selmat][5]},
						fleshy={times={[2]=axefbases[selmat][2]*toolbenefit_one[selgem], [3]=axefbases[selmat][3]*toolbenefit_one[selgem]}, uses=axefbases[selmat][4]*toolbenefit_two[selgem], maxlevel=axefbases[selmat][5]}
					}
				},
			})
			minetest.register_tool("gems:shovel_"..metal[selmat].."_"..gem[selgem], {
				description = formalmetal[selmat].." Shovel ("..gem[selgem].." encrusted)",
				inventory_image = "gems_tool_shovel_"..metal[selmat].."_"..gem[selgem]..".png",
				tool_capabilities = {
					max_drop_level=1,
					groupcaps={
						crumbly={times={[1]=shovelbases[selmat][1]*toolbenefit_one[selgem], [2]=shovelbases[selmat][2]*toolbenefit_one[selgem], [3]=shovelbases[selmat][3]*toolbenefit_one[selgem]}, uses=shovelbases[selmat][4]*toolbenefit_two[selgem], maxlevel=shovelbases[selmat][5]}
					}
				},
			})
			minetest.register_tool("gems:sword_"..metal[selmat].."_"..gem[selgem], {
				description = formalmetal[selmat].." Sword ("..gem[selgem].." encrusted)",
				inventory_image = "gems_tool_sword_"..metal[selmat].."_"..gem[selgem]..".png",
				tool_capabilities = {
					max_drop_level=1,
					groupcaps={
						fleshy={times={[1]=swordfbases[selmat][1]*toolbenefit_one[selgem], [2]=swordfbases[selmat][2]*toolbenefit_one[selgem], [3]=swordfbases[selmat][3]*toolbenefit_one[selgem]}, uses=swordfbases[selmat][4]*toolbenefit_two[selgem], maxlevel=swordfbases[selmat][5]},
						snappy={times={[2]=swordsbases[selmat][2]*toolbenefit_one[selgem], [3]=swordsbases[selmat][3]*toolbenefit_one[selgem]}, uses=swordsbases[selmat][4]*toolbenefit_two[selgem], maxlevel=swordsbases[selmat][5]},
						choppy={times={[3]=swordcbases[selmat][3]*toolbenefit_one[selgem]}, uses=swordcbases[selmat][4]*toolbenefit_two[selgem], maxlevel=swordcbases[selmat][5]}
					}
				},
			})
			encrust_a_tool("gems:pick_"..metal[selmat].."_"..gem[selgem],"default:pick_steel","gems:"..gem[selgem])
			encrust_a_tool("gems:axe_"..metal[selmat].."_"..gem[selgem],"default:axe_steel","gems:"..gem[selgem])
			encrust_a_tool("gems:shovel_"..metal[selmat].."_"..gem[selgem],"default:shovel_steel","gems:"..gem[selgem])
			encrust_a_tool("gems:sword_"..metal[selmat].."_"..gem[selgem],"default:sword_steel","gems:"..gem[selgem])
		else
			minetest.register_tool("gems:pick_"..metal[selmat].."_"..gem[selgem], {
				description = formalmetal[selmat].." Pickaxe ("..gem[selgem].." encrusted)",
				inventory_image = "gems_tool_pick_"..metal[selmat].."_"..gem[selgem]..".png",
				tool_capabilities = {
					max_drop_level=1,
					groupcaps={
						cracky={times={[1]=pickbases[selmat][1]*toolbenefit_one[selgem], [2]=pickbases[selmat][2]*toolbenefit_one[selgem], [3]=pickbases[selmat][3]*toolbenefit_one[selgem]}, uses=pickbases[selmat][4]*toolbenefit_two[selgem], maxlevel=pickbases[selmat][5]}
					}
				},
			})
			minetest.register_tool("gems:axe_"..metal[selmat].."_"..gem[selgem], {
				description = formalmetal[selmat].." Axe ("..gem[selgem].." encrusted)",
				inventory_image = "gems_tool_axe_"..metal[selmat].."_"..gem[selgem]..".png",
				tool_capabilities = {
					max_drop_level=1,
					groupcaps={
						choppy={times={[1]=axecbases[selmat][1]*toolbenefit_one[selgem], [2]=axecbases[selmat][2]*toolbenefit_one[selgem], [3]=axecbases[selmat][3]*toolbenefit_one[selgem]}, uses=axecbases[selmat][4]*toolbenefit_two[selgem], maxlevel=axecbases[selmat][5]},
						fleshy={times={[2]=axefbases[selmat][2]*toolbenefit_one[selgem], [3]=axefbases[selmat][3]*toolbenefit_one[selgem]}, uses=axefbases[selmat][4]*toolbenefit_two[selgem], maxlevel=axefbases[selmat][5]}
					}
				},
			})
			minetest.register_tool("gems:shovel_"..metal[selmat].."_"..gem[selgem], {
				description = formalmetal[selmat].." Shovel ("..gem[selgem].." encrusted)",
				inventory_image = "gems_tool_shovel_"..metal[selmat].."_"..gem[selgem]..".png",
				tool_capabilities = {
					max_drop_level=1,
					groupcaps={
						crumbly={times={[1]=shovelbases[selmat][1]*toolbenefit_one[selgem], [2]=shovelbases[selmat][2]*toolbenefit_one[selgem], [3]=shovelbases[selmat][3]*toolbenefit_one[selgem]}, uses=shovelbases[selmat][4]*toolbenefit_two[selgem], maxlevel=shovelbases[selmat][5]}
					}
				},
			})
			minetest.register_tool("gems:sword_"..metal[selmat].."_"..gem[selgem], {
				description = formalmetal[selmat].." Sword ("..gem[selgem].." encrusted)",
				inventory_image = "gems_tool_sword_"..metal[selmat].."_"..gem[selgem]..".png",
				tool_capabilities = {
					max_drop_level=1,
					groupcaps={
						fleshy={times={[2]=swordfbases[selmat][2]*toolbenefit_one[selgem], [3]=swordfbases[selmat][3]*toolbenefit_one[selgem]}, uses=swordfbases[selmat][4]*toolbenefit_two[selgem], maxlevel=swordfbases[selmat][5]},
						snappy={times={[2]=swordsbases[selmat][2]*toolbenefit_one[selgem], [3]=swordsbases[selmat][3]*toolbenefit_one[selgem]}, uses=swordsbases[selmat][4]*toolbenefit_two[selgem], maxlevel=swordsbases[selmat][5]},
						choppy={times={[3]=swordcbases[selmat][3]*toolbenefit_one[selgem]}, uses=swordcbases[selmat][4]*toolbenefit_two[selgem], maxlevel=swordcbases[selmat][5]}
					}
				},
			})
			encrust_a_tool("gems:pick_"..metal[selmat].."_"..gem[selgem],"moreores:pick_"..metal[selmat],"gems:"..gem[selgem])
			encrust_a_tool("gems:axe_"..metal[selmat].."_"..gem[selgem],"moreores:axe_"..metal[selmat],"gems:"..gem[selgem])
			encrust_a_tool("gems:shovel_"..metal[selmat].."_"..gem[selgem],"moreores:shovel_"..metal[selmat],"gems:"..gem[selgem])
			encrust_a_tool("gems:sword_"..metal[selmat].."_"..gem[selgem],"moreores:sword_"..metal[selmat],"gems:"..gem[selgem])
		end
	end
end

local function generate_ore(name, wherein, minp, maxp, seed, chunks_per_volume, ore_per_chunk, height_min, height_max)
	if maxp.y < height_min or minp.y > height_max then
		return
	end
	local y_min = math.max(minp.y, height_min)
	local y_max = math.min(maxp.y, height_max)
	local volume = (maxp.x-minp.x+1)*(y_max-y_min+1)*(maxp.z-minp.z+1)
	local pr = PseudoRandom(seed)
	local num_chunks = math.floor(chunks_per_volume * volume)
	local chunk_size = 3
	if ore_per_chunk <= 4 then
		chunk_size = 2
	end
	local inverse_chance = math.floor(chunk_size*chunk_size*chunk_size / ore_per_chunk)
	--print("generate_ore num_chunks: "..dump(num_chunks))
	for i=1,num_chunks do
	if (y_max-chunk_size+1 <= y_min) then return end
		local y0 = pr:next(y_min, y_max-chunk_size+1)
		if y0 >= height_min and y0 <= height_max then
			local x0 = pr:next(minp.x, maxp.x-chunk_size+1)
			local z0 = pr:next(minp.z, maxp.z-chunk_size+1)
			local p0 = {x=x0, y=y0, z=z0}
			for x1=0,chunk_size-1 do
			for y1=0,chunk_size-1 do
			for z1=0,chunk_size-1 do
				if pr:next(1,inverse_chance) == 1 then
					local x2 = x0+x1
					local y2 = y0+y1
					local z2 = z0+z1
					local p2 = {x=x2, y=y2, z=z2}
					if minetest.env:get_node(p2).name == wherein then
						minetest.env:set_node(p2, {name=name})
					end
				end
			end
			end
			end
		end
	end
	--print("generate_ore done")
end

minetest.register_on_generated(function(minp, maxp, seed)
	math.randomseed(os.time())
	local current_seed = seed + math.random(10,100)
	local function get_next_seed()
		current_seed = current_seed + 1
		return current_seed
	end
	generate_ore("gems:mineral_garnet", "default:stone", minp, maxp, get_next_seed(), 1/7/7/7, 1, -31000, -64)
	generate_ore("gems:mineral_aquamarine", "default:stone", minp, maxp, get_next_seed(), 1/7/7/7, 1, -31000, -128)
	generate_ore("gems:mineral_topaz", "default:stone", minp, maxp, get_next_seed(), 1/7/7/7, 1, -31000, -256)
	generate_ore("gems:mineral_diamond", "default:stone", minp, maxp, get_next_seed(), 1/7/7/7, 1, -31000, -512)
	generate_ore("gems:mineral_opal", "default:stone", minp, maxp, get_next_seed(), 1/7/7/7, 1, -31000, -1024)
end)

print("[Gems] Loaded!")
