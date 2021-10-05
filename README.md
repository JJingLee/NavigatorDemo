# NavigatorDemo
## 概念

        頁面導航技術並不是特別不一樣的觀念，唯一的重點是在於 **“讓App能從任何頁面順暢的到達任何頁面”**，為了達到這個目的，導航最好是抽象收在同一個模組裡．以下給一些想像：

### 情境一：

        今天頁面轉換現況是A→B→C→...→Z，我統一收起到同一個地方來處理從Z回到任何頁面的方法(如下)的話，有幾個好處：

1. 來開發速度加快
2. 即使未來導航技術改變也只要改面 popTo 實作內容即可
3. 頁面導航如果超過幾十頁甚至百頁後需要做記憶體管理或者遍歷速度的優化時，也可以統一處理

```jsx
Navigator.popTo(C);
```

### 情境二：

        假如今天有多個導航佇列（如 iOS 有 present / push 兩種基本佇列維護方式，且tabbar也可能有多個佇列），頁面需要在佇列之間跳轉時，最好也把各佇列收在一起，才能 :

1. 維護各駐列當前狀態
2. 佇列間跳轉工法優化（如把iOS present 用動畫做成 push減少佇列轉換成本，這塊 demo 有稍作演示
3. 各跳轉客製動畫收攏

### 情境三：

        把這個導航技術收攏後，有機會再進一步配合路由及頁面模塊做到更動態的產品流程設計，例如幾天點擊後的下一頁大崩潰，我們要緊急透過後端下指令：

跳出alert告知 → 跳回首頁 → 展示登入頁．

```jsx
/*
[
	{
		command : Router,
		parameter : [
			"url" : "kkday://alert?title=please%20Contact%20Us"
		]
	},
	{
		command : Navigator,
		parameter : [
			"target" : "home"
			"action" : "dismiss"
		]
	},
	{
		command : Router,
		parameter : [
			"url" : "kkday://login"
		]
	}
]

then, we actually do ...
*/
function Next() {
	Router.open("alert?title=please%20Contact%20Us")
				.then {
						Navigator.popTo(Home);
						//promise done. #resolver(void);
				}.then {
						Router.open("kkday://login");
				}
}
```

        除此之外還有相當多的花俏應用，這個模組看似基本，但實際上認真收斂的話會是日後過場動畫模組化、動態活動腳本、風險控管...等一系列規劃的基本功．

## Demo

這個 Demo 基本上寫得沒有很完整，不過大致上針對上述的前兩個情境稍作demo．而使用情境就這麼簡單(源碼ViewController2.swift)：

```swift
@objc func pushtoVC2() {
    KKNavigator.shared.push(ViewController2())
}

@objc func popToVC() {
    KKNavigator.shared.pop(to: ViewController.self)
}
@objc func presentVC2() {
    KKNavigator.shared.present(ViewController2())
}

@objc func dismissVC() {
    KKNavigator.shared.dismiss(to: ViewController.self)
}
```
