--- floating_anchor
-- @module floating_anchor
-- @release 0.5
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
	place_position.y = place_position.y - 0.8
	log_message("action", string.format("(%d, %d, %d)", place_position.x, place_position.y, place_position.z))
	
	-- Check if the player is allowed to place nodes there
	local name = player:get_player_name()
	if minetest.is_protected(place_position,name) then
		minetest.record_protection_violation(place_position,name)
		return
	end
	
	-- Place the floating anchor in the world
	local node_to_check = minetest.get_node(place_position)
	if node_to_check.name == "air" then
		minetest.set_node(place_position, { name = "floating_anchor:floating_anchor" })
		-- Take an item from the player's stack & return the new stack with 1 fewer items in it
		itemstack:take_item(1)
	end
	
	return itemstack
end

minetest.register_node("floating_anchor:floating_anchor", {
	description = "Floating Anchor (node - don't use)",
	tiles = {"floating-anchor.png"},
	groups = {
		cracky = 1,
		not_in_creative_inventory = 1,
		oddly_breakable_by_hand = 2
	},
	drop = "floating_anchor:floating_anchor_item"
})

minetest.register_craftitem("floating_anchor:floating_anchor_item", {
	description = "Floating Anchor",
	_doc_items_longdesc = "A strange floating anchor that can be placed in mid-air.",
	_doc_items_usagehelp = "Right click to place it beneath your feet when flying (or falling).",
	inventory_image = "[inventorycube{floating-anchor.png{floating-anchor.png{floating-anchor.png",
	wield_image = "floating-anchor.png",
	visual = "cube",
	on_place = do_anchor_place,
	on_secondary_use = do_anchor_place
})

minetest.register_craft({
	output = "floating_anchor:floating_anchor_item",
	recipe = {
		{"group:wool", "group:wool", "group:wool"},
		{"group:wool", "default:steel_ingot", "group:wool"},
		{"group:wool", "group:wool", "group:wool"},
	}
})

log_message("info", "Loaded!")
