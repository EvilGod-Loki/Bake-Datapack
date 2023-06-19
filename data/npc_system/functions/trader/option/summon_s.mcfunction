summon minecraft:villager ~ -64 ~ {Tags:["npc.tag","npc.option","npc.trader_s","npc.this"],Team:"npc.trader",CustomName:'{"text":"售出"}',NoAI:1b,Invulnerable:1b,Silent:1b,ActiveEffects:[{Id:11,Duration:-1,Amplifier:4b,ShowParticles:0b},{Id:14,Duration:-1,Amplifier:0b,ShowParticles:0b}],VillagerData:{profession:"minecraft:librarian",level:6}}
data modify entity @e[limit=1,type=minecraft:villager,tag=npc.trader_s,tag=npc.this] Offers.Recipes set from entity @e[limit=1,type=minecraft:marker,tag=npc.this] data.Sell
data modify entity @e[limit=1,type=minecraft:villager,tag=npc.trader_s,tag=npc.this] Offers.Recipes[].rewardExp set value 0b
scoreboard players set @e[limit=1,type=minecraft:villager,tag=npc.trader_s,tag=npc.this] npc.reset 6

summon minecraft:interaction ^0.75 ^-1.51 ^0.75 {Tags:["npc.tag","npc.option","npc.blocker","npc.trader_s","npc.this"],width:0.625f,height:1.26f}
summon minecraft:text_display ^0.75 ^-0.0375 ^0.75 {Tags:["npc.tag","npc.option","npc.trader_s","npc.this"],text:'{"color":"black","text":"售出"}',billboard:"vertical",background:-1073741825,transformation:{translation:[0.0f,-0.25f,0.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.8f,0.8f,0.8f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
summon minecraft:item_display ^0.75 ^-0.0375 ^0.75 {Tags:["npc.tag","npc.option","npc.trader_s","npc.this"],item:{id:"minecraft:diamond",Count:1b},billboard:"vertical",transformation:{translation:[0.0f,0.25f,0.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.5f,0.5f,0.5f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
