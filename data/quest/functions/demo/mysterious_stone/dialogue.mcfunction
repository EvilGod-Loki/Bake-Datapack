# 由 "測試測試收音機" 觸發
data modify storage quest:dialogue demo.mysterious_stone.Start set value {Texts:['{"text":"喔你來得正好"}','{"text":"創辦人那裡似乎出了點問題"}','{"text":"要求我尋找一個叫做「神奇石頭」的道具"}','{"text":"我記得 ","extra":[{"underlined":true,"text":"測試用末天機器人"},{"text":" 那邊有很多"}]}','{"text":"不過目前我手邊要處理的事太多了"}','{"text":"能請你幫我去跟他拿嗎"}'],Options:[{Option:'{"text":"接受任務"}',React:['{"text":"拜託了!"}'],Command:"function quest:demo/mysterious_stone/start"},{Option:'{"text":"拒絕任務"}',React:['{"text":"沒關係"}','{"text":"那我稍後再找時間去跟他拿"}']}],Quest:1b}

# 由 "測試測試收音機" 觸發
data modify storage quest:dialogue demo.mysterious_stone.Start_Remind set value {Texts:['{"text":"記得要去找 ","extra":[{"underlined":true,"text":"測試用末天機器人"},{"text":" 喔"}]}']}

# 由 "測試用末天機器人" 觸發
data modify storage quest:dialogue demo.mysterious_stone.Ask set value {Texts:['{"text":"神奇石頭?"}','{"text":"我當然有啊"}','{"text":"而且現在特價中喔"}','{"text":"一顆只賣你新台幣1000元--"}','{"text":"--當然是開玩笑的"}','{"text":"按照規定這東西我得直接給你"}','{"italic":true,"text":"不然你以為我有多不想說剛剛是開玩笑的啊"}','{"text":"唉...你就拿去吧"}'],Command:"function quest:demo/mysterious_stone/give"}

# 由 "測試用末天機器人" 觸發
data modify storage quest:dialogue demo.mysterious_stone.Ask_Remind set value {Texts:['{"text":"把神奇石頭拿去給 ","extra":[{"underlined":true,"text":"收音機器人"},{"text":" 吧"}]}','{"text":"弄丟了我可不補發喔"}']}

# 由 "測試測試收音機" 觸發
data modify storage quest:dialogue demo.mysterious_stone.Got set value {Texts:['{"text":"看來你拿到神奇石頭了"}','{"text":"太感謝你了"}','{"text":"雖然算不上什麼謝禮"}','{"text":"還請你收下這個吧"}'],Command:"function quest:demo/mysterious_stone/finish"}

# 由 "測試測試收音機" 觸發
data modify storage quest:dialogue demo.mysterious_stone.Why set value {Texts:['{"text":"你拿到神奇石頭了嗎?"}','{"text":"拿了但現在不在身上?"}'],Options:[{Option:'{"text":"表示馬上去拿來"}',React:['{"text":"我等你喔"}']},{Option:'{"text":"表示弄丟了(放棄任務)"}',React:['{"text":"好吧沒關係"}','{"text":"我稍後再找時間去跟他拿"}'],Command:"function quest:demo/mysterious_stone/give_up"}],Quest:1b}
