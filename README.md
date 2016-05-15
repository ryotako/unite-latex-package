# unite-latex-package
Unite source which gathers installed latex packages

## Requires
* [unite.vim](https://github.com/Shougo/unite.vim)
* kpsewhich (included with TexLive)

## Usage

インストールされたLaTeXパッケージを表示します．
初回起動時のみ，パッケージを検索してキャッシュを作成するため時間がかかります．
キャッシュを更新するためにはコマンド:LatexPackageCacheUpdateを実行してください．
