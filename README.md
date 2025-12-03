[![cc-by-nc-shield][]][cc-by-nc]

## japanese-otf の非公式マニュアル

japanese-otf の非公式マニュアルです。

- japanese-otf および otf パッケージに関するドキュメント

    [<samp>otf-unofficial-guide.pdf</samp>](./otf-unofficial-guide.pdf)

- ajmacros パッケージに関するドキュメント

    [<samp>ajmacros-unofficial-guide.pdf</samp>](./ajmacros-unofficial-guide.pdf)


これらのドキュメントは TeX & LaTeX Advent Calendar 2025 3 日目に公開されました。

## ドキュメントのビルド

マニュアルをビルドするには [build.sh](./build.sh) を利用します。

```bash
sh build.sh
```

latexmk を介して自動的に <samp>otf-unofficial-guide.pdf</samp> と <samp>ajmacros-unofficial-guide.pdf</samp> を生成し、カレントディレクトリに移動させます。

また、余剰ファイルは自動的に削除されます。

ただし、IBM Plex Sans JP フォントを使用するためいくつかのセットアップが必要です。

## ここは間違いでは…？

もしも間違い、不明瞭な点等あれば Issue をください。

## 公開

- 2025/12/03: 公開、初版 :christmas_tree:

## License

ドキュメントおよび付随するコードファイルは [Creative Commons Attribution-NonCommercial 4.0 International License][cc-by-nc] で公開します。

[cc-by-nc]: http://creativecommons.org/licenses/by-nc/4.0/
[cc-by-nc-image]: https://i.creativecommons.org/l/by-nc/4.0/88x31.png
[cc-by-nc-shield]: https://img.shields.io/badge/License-CC%20BY--NC%204.0-lightgrey.svg
