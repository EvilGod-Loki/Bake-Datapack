advancement revoke @s only items:projectile/plate_effect
effect clear @s minecraft:luck
execute store result score $temp items.check_time run time query gametime
scoreboard players set $set effects.amplifier 0
scoreboard players set $set effects.duration 1
function effects:bleed/give
