scoreboard players set @s npc.look_option 0
data modify entity @e[limit=1,type=minecraft:text_display,tag=npc.option_a,tag=npc.this] text set value '{"color":"black","text":"","extra":[{"nbt":"data.Options[0].Option","entity":"@e[limit=1,type=minecraft:marker,tag=npc.this]","interpret":true}]}'
data modify entity @e[limit=1,type=minecraft:text_display,tag=npc.option_b,tag=npc.this] text set value '{"color":"black","text":"","extra":[{"nbt":"data.Options[1].Option","entity":"@e[limit=1,type=minecraft:marker,tag=npc.this]","interpret":true}]}'
data modify entity @e[limit=1,type=minecraft:text_display,tag=npc.option_c,tag=npc.this] text set value '{"color":"black","text":"","extra":[{"nbt":"data.Options[2].Option","entity":"@e[limit=1,type=minecraft:marker,tag=npc.this]","interpret":true}]}'
data modify entity @e[limit=1,type=minecraft:text_display,tag=npc.option_d,tag=npc.this] text set value '{"color":"black","text":"","extra":[{"nbt":"data.Options[3].Option","entity":"@e[limit=1,type=minecraft:marker,tag=npc.this]","interpret":true}]}'
data modify entity @e[limit=1,type=minecraft:text_display,tag=npc.option_e,tag=npc.this] text set value '{"color":"black","text":"離開"}'

