execute positioned ~ ~1.6 ~ run summon item_display ^ ^ ^2 {Tags:["air_feather","new_air_feather","on_flying"],item:{Count:1b,id:"minecraft:feather"},transformation:{left_rotation:[-0.3641f,0.1694f,-0.2882f,0.8698f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,1.0f,1.0f],translation:[0.0f,0.0f,0.0f]}}
execute positioned ~ ~1.6 ~ as @e[type=item_display,tag=new_air_feather] run tp @s ^ ^ ^2 ~ ~
scoreboard players set @e[type=item_display,tag=new_air_feather] knowledge.object_duration 1200
schedule function knowledge:air_feather/init_anmition 2t
tag @e[type=item_display,tag=new_air_feather] remove new_air_feather