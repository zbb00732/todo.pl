# todo.pl

todo.pl - トドちゃんを数えるスクリプト

## synopsis

引数を省略すると、 `$HOME/src/` 内を調べる。

    % todo

第一引数にディレクトリ名を渡すと、そのディレクトリを調べる。

    % todo doc

## description

`*.txt` ファイル及び `*.md` ファイルに対して、ファイル内の `TODO: ` 文字列ををカウントする。 `TODO: ` の合計件数も表示する。

一行に複数の `TODO: ` が存在しても、一件としてカウントする。

## see also

このスクリプトは[結城浩](https://www.hyuki.com/)氏の[トドちゃんを数えるPerlスクリプト](http://www.hyuki.com/d/200608.html#i20060818100343)を自分用にちょっとだけ改変したものです。
