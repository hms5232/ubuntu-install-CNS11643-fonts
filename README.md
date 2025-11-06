# ubuntu-install-CNS11643-fonts
ubuntu安裝CNS11643中文標準交換碼全字庫的正楷體、正宋體字型

## 關於　About
藉由 shell script 簡單快速地安裝由臺灣國家發展委員會提供之CNS11643中文標準交換碼全字庫（簡稱「全字庫」）中，免費提供的兩個字型──**正楷體**、**正宋體**。  
字型的原始下載位置：https://data.gov.tw/dataset/5961

## 需求　Requirements
1. wget（用於下載字型檔案）
2. unzip（用於解壓縮下載好的字型檔案）
3. 足夠的儲存空間（雖然字型檔案很小，但還有其他文件會一起下載並解壓縮，建議檔案下載位置目錄空間有個1GB較為保險）

## 使用說明　Manual
1. [Clone](https://github.com/hms5232/ubuntu-install-CNS11643-fonts.git) 或直接[下載zip檔案](https://github.com/hms5232/ubuntu-install-CNS11643-fonts/archive/master.zip)
2. 取出對應的 shell script 檔案
3. 用`cd`指令移動到 shell 目錄
3. 執行`chmod +x <shell script which you want to execute>`來使 shell 檔案可執行
4. 執行`./<shell script name which you want to execute>`開始下載、解壓縮和安裝等程序（中間會需要使用者輸入密碼以執行 sudo 指令）  
  
※由於更新字型指令需要 root 權限，如不想等到執行該指令時才輸入密碼，請在最後一步（執行 shell script）加上`sudo`  
※因為相關檔案為即時下載，作業時間會因為當下網路環境等有所變化，請耐心等待

### 移除字型　Uninstallation

```sh
# 依照當初安裝方式二選一執行，或著都執行亦可
# 移除下載來的字型檔案（安裝給自己用而已）
rm $HOME/.fonts/TW-Sung-*.ttf $HOME/.fonts/TW-Kai-*.ttf
# 移除下載來的字型檔案（安裝給所有使用者）
sudo rm -rf /usr/local/share/fonts/CNS11643/

# 清除並重建字型快取
sudo fc-cache -fv
```

## 聲明　Declaration
本人編寫 shell script 僅供簡化安裝程序，使用者應遵守[〈政府資料開放授權條款〉](https://data.gov.tw/license)相關規定。使用者如何使用字型及是否遵守授權條款之規定，作者無法保證也不負任何責任，亦不構成任何資料提供使用者或機關申述、保證或暗示其推薦、同意、許可或核准之意思表示。

## 相關專案　Related projects

* GitHub Action 版：https://github.com/hms5232/install-CNS11643-fonts-action

## 許可　License
請見 [LICENSE 頁面](https://github.com/hms5232/ubuntu-install-CNS11643-fonts/blob/master/LICENSE)  。
  
See [LICENSE page](https://github.com/hms5232/ubuntu-install-CNS11643-fonts/blob/master/LICENSE).
