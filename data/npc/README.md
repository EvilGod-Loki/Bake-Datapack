# 恩批吸系統

## 目錄
- [恩批吸系統](#恩批吸系統)
  - [目錄](#目錄)
  - [命名空間](#命名空間)
  - [基本檔案](#基本檔案)
    - [進度](#進度)
    - [函數](#函數)
  - [互動設定](#互動設定)
    - [通常設定](#通常設定)
    - [商店設定](#商店設定)
  - [任務流程](#任務流程)
    - [任務節點](#任務節點)
    - [任務對話](#任務對話)
    - [回呼函數](#回呼函數)
    - [任務提示](#任務提示)
    - [其他建議](#其他建議)

## 命名空間

NPC系統使用了以下四個命名空間:
* `npc`
* `npc_system`
* `quest`
* `quest_system`

其中不帶有 "system" 單字的命名空間用於儲存對話腳本及各式設定 (也就是你應該要編輯和新增檔案的地方)。  
帶有 "system" 單字的則是地圖運作時會使用到的相關系統 (除非經過允許，禁止更動這裡的東西)。  
`npc` 的命名空間可以設定一個NPC的外觀、通常對話以及商人所販售的物品等等，並且扮演著能從個別的NPC來啟動其他功能的角色。  
`quest` 的命名空間則將觸發任務時的對話獨立了出來，並儲存著跟任務有關的對話中會執行的函數。  

## 基本檔案

在這個系統中，一個最簡單的NPC由至少6個檔案所組成。  
此6個檔案分別為2個進度與4個函數，並依照NPC所在的區域來分資料夾。      

### 進度

NPC的基本進度如下列所示:

* `data/npc/advancements/<region_id>/<npc_id>_start.json`
* `data/npc/advancements/<region_id>/<npc_id>_next.json`

其中 "start" 進度會偵測玩家開始與特定NPC互動，"next" 進度則能偵測所有後續的互動。  

以下提供各檔案之模板，請於複製到目標檔案夾後更改檔案名稱及後綴，將 `<region_id>` 替換成地區代號、`<npc_id>` 替換成NPC代號 (請全部使用英文小寫字母及英文底線)。  
* "start" 進度之[模板](advancements/template/start)
* "next" 進度之[模版](advancements/template/next)

### 函數

NPC的基本函數如下列所示:

* `data/npc/functions/<region_id>/<npc_id>/summon.mcfunction`
* `data/npc/functions/<region_id>/<npc_id>/dialogue.mcfunction`
* `data/npc/functions/<region_id>/<npc_id>/start.mcfunction`
* `data/npc/functions/<region_id>/<npc_id>/next.mcfunction`

此四個函數可分為「設定類」及「執行類」。  
設定類包含 "summon" 及 "dialogue" 函數，其中 "summon" 用於設定外觀及原地召喚該NPC，"dialogue" 負責所有通常對話相關事務。  
(設定類函數應由區域管理系統呼叫。亦可撰寫多個版本的設定類函數，使NPC能在遊戲不同階段產生變化。)  
執行類包含 "start" 及 "next" 函數，其中 "start" 用於回應 "start" 進度的呼叫以及開啟NPC對話，"next" 則用於回應 "next" 進度及推進對話過程。  

以下提供各檔案之模板，請於複製到目標檔案夾後更改檔案名稱及後綴，將 `<region_id>` 替換成地區代號、`<npc_id>` 替換成NPC代號 (請全部使用英文小寫字母及英文底線)。  
* "summon" 函數之[模板](functions/template/summon)
  * 此函數中應召喚三種實體
    1. 顯示本體: 通常為盔甲架或村民，亦可使用其他實體。會於對話中持續面向啟動對話的玩家，對話結束後將轉回初始設定的轉向。其CustomName用於儲存顯示的NPC名稱。
       * 可召喚其他顯示用實體，應有的tag有 `"npc.tag"` 及 `"npc.<redion_id>.<npc_id>"`。
    2. 互動實體: 用於偵測玩家互動，觸發進度。其碰撞箱大小設定應包覆整個顯示本體，或是符合玩家的直覺。
    3. 特製名條: 本系統使用文字顯示實體來替代傳統的實體名條，他會在進入和離開對話時移動位置。一般來說這個只需要調整其召喚之相對高度即可 (建議為顯示本體碰撞箱高度+0.475)，其餘NBT不須調整。
* "dialogue" 函數之[普通模板](functions/template/dialogue_common)及[商店模板](functions/template/dialogue_trader)，寫法將在[互動設定](#互動設定)中詳細說明
* "start" 函數之[模板](functions/template/start)
* "next" 函數之[模板](functions/template/next)

## 互動設定

所有跟NPC互動時的對話、選項等，可在 "dialogue" 函數中設定，設定方法為對該NPC所擁有的「指令空間 (command storage)」進行編輯。  
(因此請先確保自己能夠操作 `/data modify` 指令的相關基礎功能再來喔。)  
每個NPC都有其獨立的 `storage`，位置為 `npc:<region_id>` 中的 `<npc_id>` 標籤，這些位置底下的元素會影響該NPC的行為，以下將列出有效的子標籤。  

### 通常設定

* Normal (list of components) - 可儲存多個通常對話，預設按照順序觸發
  * Texts (list of json strings) - 必填，包含多個 "json string" 的列表，該對話之多行內容，按順序觸發
  * Once (boolean) - 選填，若設為 `1b`，此對話觸發後將從 `storage` 中刪除，無法再次顯示
  * Options (list of components) - 選填，於通常對話或選項對話結束後將會進入選項階段，最多四個選項 (會多顯示一個「離開」選項)
    * Option (json string) - 顯示於選項之文字
    * React (list of json strings) - 包含多個 "json string" 的列表，該選項對話之多行內容，按順序觸發 (同Texts之寫法)
    * Condition (component) - 選項條件，若玩家不符合條件將無法觸發該選項
      * Item (data format of an item) 條件物品 (目前只有這項，其他的有需要再說)
    * End (boolean) - 若設為 `1b`，此選項對話結束後將不會回到選項
    * Extra (component) - 額外區域，目前用於儲存選項的回呼函數設定，多用於任務系統
      * Start_Command (string) - 合法指令的字串，將於選項被選中時額外執行此指令，執行者為對話中的玩家
      * End_Command (string) - 合法指令的字串，將於選項對話正常結束時額外執行此指令，執行者為對話中的玩家
      * Leave_Command (string) - 合法指令的字串，將於玩家離開對話距離或登出導致對話結束時額外執行此指令，執行者為對話中的玩家，若玩家登出則會由伺服器執行
  * Quest (boolean) - 選填，任務選項模式，於Options存在時才有效果。若設為 `1b`，進入選項時將不會出現「離開」選項，且選項對話結束時亦不會再次進入選項
  * Extra (component) - 額外區域，目前用於儲存通常對話的回呼函數設定，多用於任務系統
    * Start_Command (string) - 合法指令的字串，將於對話開始時額外執行此指令，執行者為對話中的玩家
    * End_Command (string) - 合法指令的字串，將於對話正常結束時額外執行此指令，執行者為對話中的玩家
    * Leave_Command (string) - 合法指令的字串，將於玩家離開對話距離或登出導致對話結束時額外執行此指令，執行者為對話中的玩家，若玩家登出則會由伺服器執行
* NormalRandom (boolean) - 選填，若設為 `1b`，多個通常對話將以隨機序列被觸發
* Exit (component) - 於Options存在或Trader為`1b`時才有效果，將於點選「離開」選項後觸發此處的對話
  * Texts (list of json strings) - 包含多個 "json string" 的列表，該對話之多行內容，按順序觸發
* Idle (list of components) - 選填，NPC閒置 (不在與玩家互動) 時，若此列表有內容，將會以設定的時長與間隔顯示文字於NPC頭上
  * Text (json string) - 顯示的文字
  * Duration (component or interger) - 文字顯示的秒數，可為固定值 (整數) 或浮動值 (見下列標籤)
    * max (interger) - 隨機數 (uniform) 的上界，應大於min
    * min (interger) - 隨機數 (uniform) 的下界，不得小於0
  * Rest (component or interger) - 距離下次文字顯示的秒數，格式同Duration

### 商店設定

* Trader (boolean) - 若設為 `1b`，此NPC將被轉換成商店，並在通常對話結束後進入交易選項
* TraderNormal (list of components) - 商店必填，可儲存多個商店對話，於交易選項中選擇「交談」後顯示，預設按照順序觸發，單個對話結束後將回到交易選項
  * 與Normal之內容相同
* TraderNormalRandom (boolean) - 選填，若設為 `1b`，多個商店對話將以隨機序列被觸發
* Buy (list of components) - 「購入」內的交易選項，基本與村民之交易選項相同
  * buy (component) - 玩家應交付的物品，可為 `{id, tag, Count}` 格式或 `{Name, Count}` 格式，其中 `Name` 為字串，應填入戰利品表路徑 (如同在 `/loot` 指令中打的那樣)
  * buyB (component) - 玩家應交付的物品，格式同buy
  * sell (component) - 玩家將獲得的物品，格式同buy
  * maxUses (interger) - 玩家可交易的次數，當前版本填上2147483647就好，因此時並未寫上能限制購買次數的功能，每次重新召喚村民時此數字都會重置
* Sell (list of components) - 「售出」內的交易選項，基本與村民之交易選項相同
  * 格式同Buy

## 任務流程

任務同樣以區域來分資料夾，如果要設計跨區域的任務，以任務開始的區域為準。  
每個任務要分配一個代號 (`quest_id`)，例如: `mysterious_stone`。  
同一個任務相關的進度及函數應儲存在下列路徑:

* `data/quest/advancements/<region_id>/<quest_id>/` 
* `data/quest/functions/<region_id>/<quest_id>/`
  
且應將記分板 `quest.state` 在假玩家 `$<region_id>.<quest_id>` 底下的分數作為任務狀態之紀錄。  
任務狀態記分板中的分數為判斷當前任務進度的重要依據。  


### 任務節點

此處的節點是指實際設計任務時的一個概念，並非此系統中的功能。  
一個任務會有兩個或以上的節點存在，節點間通常呈現順序關係 (如果你很厲害的話也可以設計分支啦)。  
節點會推進任務進度並且通常會給予玩家一個遊戲內的進度來提示接下來的行動。  
通常一個任務節點應包含:

* 一個提示用的進度
* 該任務的記分板狀態更新 *(可以是有條件的)*
* *可給予或收走任務道具*
* *可給予任務獎勵*

### 任務對話

若要使一個NPC在任務到達某個進度時觸發特殊對話，應在其"start"函數中插入判斷任務狀態記分板的條件式，並從任務的 `storage` 提取該特殊對話之設定，格式請參考[模板檔案](functions/template/start)的註解處。  
而任務相關特殊對話所應儲存的位置為: `storage quest:<region_id> <quest_id>.<dialogue_name>` (其中"dialogue_name"只要不重複並命名成能夠辨識其功能即可)。  
特殊對話的格式與NPC系統中的Normal內的一項相同。  
同一個任務的特殊對話，建議以同一個函數設定並按照順序排列，<u>**強烈建議**</u>為每行加上註解，說明此段對話於記分板為幾分時，由哪個NPC所觸發。  
於此提供一個任務對話設定函數的[模板](../quest/functions/template/dialogues)

### 回呼函數

如果要在與NPC對話時觸發一個任務節點，應使用NPC系統中的「回呼函數」功能 (參見[通常設定](#通常設定)的Extra標籤)。  
Extra標籤中的Start_Command、End_Command、Leave_Command應設為一個合法指令的字串，通常該指令為呼叫函數的指令 `function xxx:ooo`，執行者為與該NPC對話中的玩家。  
使用場合範例: 於「接受任務」選項中放入End_Command，將在該對話結束後執行「開始任務」的函數。  
於此提供一個回呼函數的[模板](../quest/functions/template/callback)。  

亦可不由NPC觸發任務節點，此時直接呼叫其中一個函數即可

### 任務提示

任務進度之提示以「進度」功能達成，預計同一個區域的任務會共用同一個根進度，並且同一個任務的進度提示要串起來，形成明顯的先後關係。  
任務提示全部設定為隱藏進度 (觸發後才會顯示)，顯示格式待定。  
(待討論)  

### 其他建議

由NPC所觸發的特殊任務對話可以不只是任務節點相關，也可根據當前任務進度給予符合情境的對話，甚至順便提供更多的提示。  
於"start"函數中判斷任務狀態給予不同對話的指令，若有異於該記分板的條件要判斷，亦可額外創建一個函數進行近一步的判斷。  
有任何其他疑問，歡迎向技術總監提出。  
