kill @e[tag=npc.demo.warrior]
summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["npc.this","npc.tag","npc.figure","npc.demo.warrior"],Rotation:[90.0f,0.0f],CustomName:'{"text":"看起來快死掉的人"}',ShowArms:1b,NoBasePlate:1b,NoGravity:1b,Invulnerable:1b,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:13948159}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"SuehiroTaihoku"}}],Pose:{Head:[32f,0f,0f],LeftLeg:[280f,323f,0f],RightLeg:[282f,29f,0f],LeftArm:[0f,0f,346f],RightArm:[332f,23f,326f]}}
summon minecraft:interaction ~ ~-0.05 ~ {Tags:["npc.this","npc.tag","npc.demo.warrior"],width:0.6f,height:1.6f}
summon minecraft:text_display ~ ~1.975 ~ {Tags:["npc.this","npc.tag","npc.name","npc.demo.warrior"],billboard:"center",background:-1073741825,transformation:{translation:[0.0f,-0.255f,0.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,1.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
data modify storage npc_system:common This set from storage npc:demo warrior
function npc_system:common/summon
