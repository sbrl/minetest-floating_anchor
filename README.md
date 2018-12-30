# minetest-floating-anchor
> A floating anchor mod for minetest. Adds an item that, when used, places a floating anchor block below the player's feet.

![A picture of the floating anchor block in mid-air.](https://i.imgur.com/4RYlEDO.png)

 - [Forum Post](https://forum.minetest.net/viewtopic.php?f=9&t=20180)


## Installation
Clone this repository into the `worldmods` subfolder of the folder that contains your world. If it doesn't exist, then you'll need to create it.


## Usage
This mod adds two items:

1. A floating anchor node
2. A floating anchor item

As indicated by the description, the node is _not_ the one you should use. For general use, it's the item you want. If you try and place the item like a node (even if you're not pointing at anything), the node form will be placed at your current position.

Upon breaking, the node form will drop the item form again for you to re-use use. If you somehow end up with the node form in your inventory, simply place it normally and break it again to turn it back into the more useful item form.

## Survival
In survival mode, a crafting recipe is available:

![The survival recipe for crafting a floating anchor. A textual representation is detailed below.](https://i.imgur.com/b7svaDT.png)

x	| 1		| 2		| 3
----|-------|-------|----------
1	| wool	| wool	| wool
2	| wool	| steel ingot	| wool
3	| wool	| wool	| wool

Feedback on the balance of this recipe is appreciated, as the author does not play survival very often.


## Contributing
Pull requests are welcome! By contributing, you agree to release your contribution under the same licenses that this repository is currently under.


### Todo List
 - Don't deduct an item from players in creative mode when placing
 - Don't drop an item for creative players breaking the node form
 - ...? ([Open an issue](https://github.com/sbrl/minetest-floating_anchor/issues/new) or [send a pull request](https://github.com/sbrl/minetest-floating_anchor/compare)!)


## License
Everything here is licensed under the _Mozilla Public License 2.0_ - except the textures (which can be found in the `textures/` folder), which are licensed under CC-BY-SA (https://creativecommons.org/licenses/by-sa/4.0/). A copy of the Mozilla Public License 2.0 can be found in the `LICENSE` file in this repository.
