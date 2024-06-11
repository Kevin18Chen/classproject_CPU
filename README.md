# classproject_CPU 
## 1. 模組說明

instruction memory主要運來存放指令，指令長度為32位元，詳細指令表如圖一，發送命立後會經由control控制各個模組，分別有4顆mux、registers、data memory與ALU，registers用來存放即將處理的資料，data memory用來存放資料，ALU為運算單元，詳細運算指令如圖二，整體架構如圖三。專案中有三個測試CPU的架構，其中cpu_complete_tb是用於測試完整的cpu。專案中有提供了五個範例，分別為資料讀寫、資料運算、判斷、迴圈與排序，可藉由修改instruction memory內讀取檔案(example1~5.txt)來切換，或直接撰寫機械碼來設計程序。

### 圖一

![!\[image\](https://github.com/Kevin18Chen/classproject_CPU/blob/main/img/cmd_table.png)](https://github.com/Kevin18Chen/classproject_CPU/blob/main/img/cmd_table.png)

### 圖二

![!\[image\](https://github.com/Kevin18Chen/classproject_CPU/blob/main/img/cpu_architecture.png)](https://github.com/Kevin18Chen/classproject_CPU/blob/main/img/alu_table.png)

### 圖三

![!\[image\](https://github.com/Kevin18Chen/classproject_CPU/blob/main/img/cpu_architecture.png)](https://github.com/Kevin18Chen/classproject_CPU/blob/main/img/cpu_architecture.png)
