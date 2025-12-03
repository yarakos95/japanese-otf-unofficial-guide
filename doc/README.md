## ドキュメント作成ガイドライン

### プリアンブル

作成されているドキュメントは多くの独自コマンド・環境によって作成されています。

複数の文書に統一して使用される独自コマンド・環境は <samp>setup-base.tex</samp> 内で作成されています。

これに加えて、文書に固有の独自コマンド・環境はそれぞれに分割されています。

- <samp>setup-otf.tex</samp>
- <samp>setup-ajmacros.tex</samp>
- <samp>setup-supplement.tex</samp>

### 執筆環境へのコマンド補完

TeXstudio あるいは LaTeX Workshop on VSCode を利用している場合、[.vscode](../.vscode/) 内にある <samp>otf-unofficial-guide.(cwl|json)</samp> を利用することで、<samp>setup-base.tex</samp> で定義されているコマンドや環境のサジェスト機能を利用できます。

### IBM Plex Sans JP フォント

フォントは [IBM/plex -- GitHub][ibmpsjp-github] から取得できます。

[ibmpsjp-github]: https://github.com/IBM/plex/tree/master/packages/plex-sans-jp/fonts/complete/otf/hinted "plex/packages/plex-sans-jp/fonts/complete/otf/hinted at master · IBM/plex"

<samp>IBMpsJP.sty</samp> は IBM Plex Sans JP を使用するためのパッケージです。これによって、`\CID` でも IBM Plex Sans JP を適用できます。

これを利用するために、[IBM_Plex_Sans_JP](../IBM_Plex_Sans_JP/) にある TFM・VF を適切な TeX ツリーに配置してください。

<samp>ajmacros-unofficial-guide</samp> では <samp>ajmacros-cmd.sty</samp> というパッケージを作成し、連続する記号を一斉に出力するパッケージを使用しています。

### <samp>otf-unofiicial-guide</samp>

otf パッケージに関する以下の事柄について記述したドキュメントです。

- パッケージオプション
- 提供するコマンド
- フォントメトリック
- スクリプト（ただし使い方はまだよく分かっていないので保留）

TeX Forum に投稿される otf パッケージの更新情報に関連がある場合は傍注で記載している。

### <samp>ajmacros-unofiicial-guide</samp>

ajmacros パッケージに関する以下の事柄について記述したドキュメントです。

- 提供されるコマンド
    - コマンドで出力される文字
- otf パッケージから提供されているが `nomacros` で抑制されるコマンド
- コマンドを使用する際の注意点
- 漢文用パッケージへの対応

原ノ味フォントではグリフが不足するため、IBM Plex Sans JP を使用します。ドキュメント内でその文字がどちらのフォントを使用しているかは明示していません。

このドキュメントを読んで実際に ajmacros パッケージから提供されるコマンドを利用する際に、記号がどの文字であるのか分かるようにコードポイントを逐一表示します。

### 補足ドキュメント

otf パッケージに関するお役立ち情報や周辺パッケージとの連携に関する情報を [supplement.tex](./supplement.tex) に収集しています。

これは現状、誰かに見せられるようにまとまっておらず、書くべき内容の方向性も曖昧なものになっています。

ビルド方法は他のドキュメントと同じです。見せられるような形になれば [build.sh](../build.sh) に追加します。

### その他

- 傍注か割注かは比較的気分で決めます
- 引数内に和文が挿入される場合はサイズを小さくします (`\jpincmd`)
