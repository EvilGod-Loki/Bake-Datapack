# copy concatenated string to executor
    execute if data block ~ ~ ~1 LastOutput run data modify storage general:gcm execute[-1].command set string block ~ ~ ~1 LastOutput 100 -38
# pop pending raw JSON string
    data modify entity 0000-0000-0000-0000-0001 CustomName set from storage general:gcm pending[0].command
    data modify storage general:gcm execute append value {id:0,command:""}
    data modify storage general:gcm execute[-1].id set from storage general:gcm pending[0].id
    data remove storage general:gcm pending[0]
    execute unless data storage general:gcm pending[0] run setblock ~ ~ ~1 chain_command_block[facing=south]
