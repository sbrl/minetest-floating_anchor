--- floating_anchor
-- @module floating_anchor
-- @release 0.1
-- @copyright 2018 Starbeamrainbowlabs
-- @license Mozilla Public License, 2.0 (MPL-2.0)
-- @author Starbeamrainbowlabs

local function log_message(level, msg)
	minetest.log(level, "[floating-anchor] " .. msg)
end

local function do_anchor_place(itemstack, player, pointed_thing)
	
	-- user.getpos() -> {x, y, z}
	
	-- Figure out where to put the anchor
	local place_position = player:getpos()
	log_message("action", string.format("(%d, %d, %d)", place_position.x, place_position.y, place_position.z))
	
	-- Place the floating anchor in the world
	minetest.set_node(place_position, { name = "floating_anchor:floating_anchor" })
	
	-- Take an item from the player's stack & return the new stack with 1 fewer items in it
	local new_itemstack = itemstack:take_item(1)
	return itemstack
end

minetest.register_node("floating_anchor:floating_anchor", {
	description = "Floating Anchor (node - don't use)",
	tiles = {"floating-anchor.png"},
	groups = { cracky = 1 },
	drop = "floating_anchor:floating_anchor_item"
})

minetest.register_craftitem("floating_anchor:floating_anchor_item", {
	description = "Floating Anchor",
	inventory_image = "floating-anchor.png",
	on_place = do_anchor_place,
	on_secondary_use = do_anchor_place
})

log_message("info", "Loaded!")
