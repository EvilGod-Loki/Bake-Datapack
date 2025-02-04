# Bake-Datapack

這裡是開發中的《麵包勇者》資料包

## 開發守則

若為開發人員，請遵守以下開發規則:

* 撰寫每個函數時請一定要考量效能問題，若不會效能優先的寫法請先讀過這兩篇文章:
  * https://forum.gamer.com.tw/C.php?bsn=18673&snA=194290
  * https://forum.gamer.com.tw/C.php?bsn=18673&snA=194512
  * 另外，marker 實體已經取代藥水雲在效能最佳化上的大部分功能了
  * tick函數內請盡量避免使用 `@e[nbt={}]` 這種目標選擇器，相關偵測應在 _以記分板條件啟動的函數_ 中執行 
  
* 命名空間: 用於區分大系統，若想新增命名空間，請向技術總監詢問註冊

* UUID: 用於特定常駐實體或是物品屬性修飾器，每個命名空間初始分配256個數值
  * 規則:
    > `00000000-0000-0000-0000-00000000xx00 ~ 00000000-0000-0000-0000-00000000xxff` 將分配給 `xx` 號命名空間使用

    > 也就是 `[I;0,0,0,256*xx+0] ~ [I;0,0,0,256*xx+255]`

* 記分板: 請盡量將記分板項目設定為 `<命名空間>.<子資料夾名稱>.<項目>`

  * 例: 紀錄拉弓時間的記分板項目應設定為 `weapons.bow.draw`
  * 顯示名稱的部分隨意
  * 虛擬玩家ID參考: `$system` (以`$`開頭方便辨識)
 
* 標籤: 也就是 `/tag` 指令和實體的 `{Tags:["..."]}`，本人是習慣使用跟記分板相同的命名邏輯，也推薦這麼做，不過要是以經寫下去了不想改的話想辦法別跟其他人撞到就好

* 指令容器: `/data modify storage` 的那個，本人習慣使用 `<命名空間>:<功能>` 來命名，不過沒有想要特別規定

* 自訂物品NBT之格式: 這部分要衝突到的機率我想是不高，真的發生問題了再說吧(怕...)

另外如果有自訂模型或材質的需求，請去吵收音機，他還沒開資源包的共用

## 命名空間註冊表
|ID |namespace          |
|---|-------------------|
|0. |general            |
|1. |knowledge          |
|2. |sanctuary_ench     |
|3. |weapons            |
|4. |items              |
|5. |npc/npc_system     |
|6. |quest/quest_system |
|7. |effects            |
|8. |universe           |
|9. |damage             |
|10.|enemy              |
|11.|boss               |

## general 命名空間下的實用函數

* player_data/
  * select: 使用此函數後可呼叫與執行者 (限玩家) 的流水編號 (general.id) 相同 id 的儲存空間，該空間將可使用此路徑存取

    `storage general:player_data Data[{selected:1b}]`
     
    且可對其內容進行讀取及編輯以處理玩家相關資料

    例:

        function general:player_data/select
        data modify storage general:player_data Data[{selected:1b}].tempOffhand set from entity @s Inventory[{Slot:-106b}]

    註: `storage general:player_data Data[{selected:1b}].Inventory` 常駐儲存著該玩家前一個 tick 的背包狀態
  
  * get_holding: 上述功能的應用，執行此函數後會將執行玩家前一個 tick 的主副手狀態儲存到 `storage general:player_data` 中的 `output.mainhand` 及 `output.offhand`
* gcm -  Generated Commands Manager, 感謝 [__雪色__](https://github.com/xuese0513) 提供此 [project](https://github.com/xuese0513/Generated-Commands-Manager) 內的技術
  * 此技術可拼接字串、拼接並執行指令、讓指定玩家執行以字串形式儲存的指令等
  * 若有認為需要使用此技術的功能，請聯絡技術總監進行評估

此頁目前由技術總監: [__末天__](https://github.com/muotian) 負責編輯
