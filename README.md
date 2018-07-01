# clientHttpSamplePost

### iOSアプリ上のボタンを押して、特定の言葉をgoogle homeから自発的に喋らせます
---
### 全体図
<img src="https://github.com/heroccccc/clientHttpSamplePost/blob/master/images/system1.png" width="400" />　　
* ###  iOS端末
  * ####  client側
  * ####  clientHttpSamplePost
* ###  server(Raspberry PiやPC)
  * ####  iOS端末とgoogle homeの中継地
  * ####  [google-home-notifier](https://github.com/noelportugal/google-home-notifier)

* ###  google home
  * ####  IP addressを覚えとく(google homeアプリから知れます)
---
### client側
* #### http通信POSTでgoogle homeに喋らせる言葉を送ります
* #### 本プログラムはボタンを押して喋らせます
* #### [Swiftで同期HTTP通信を走らせる](https://53ningen.com/synchronous-http-request-swift/)を参考にしました
---
### server側
* ####  これらを参考にしました
* ####  [google-home-notifier](https://github.com/noelportugal/google-home-notifier)
* ####  [GoogleHomeスピーカーに外部からプッシュして自発的に話してもらいます](https://qiita.com/azipinsyan/items/db4606aaa51426ac8dac)
---
#### ※firebaseを経由して喋らせることも可能です
  * ####  [WebからGoogle Homeを喋らせたり家電操作したりしてみる](https://qiita.com/miso_develop/items/09fcce17162db49dec55)
