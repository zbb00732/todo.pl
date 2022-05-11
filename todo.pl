#!/usr/bin/env perl

use 5.12.0;
use warnings;
use utf8;
use version; our $VERSION = qv('1.0.0');

my $target_type    = "*.txt *.md";
my $target_strings = "TODO: ";
my $hr             = '-' x 78;

my %todo_of;

use Encode;
my $utf8 = find_encoding('utf8');

use File::chdir;
my $dir = $ARGV[0];
if ($dir && -d $dir) {
    $CWD = $dir;
}
else {
    $CWD = "$ENV{HOME}/src/";
}

say $utf8->encode('ε(     v ﾟωﾟ) ＜ 調べるディレクトリは、');
say $utf8->encode("ε(     v ﾟωﾟ) ＜ ${CWD} だよ！");
say $hr;

foreach my $file_name (glob $target_type) {
    open my $file_handle, '<', $file_name or die "Error: $! $file_name\n";

    $todo_of{$file_name} = 0;
    while (my $line = <$file_handle>) {
        $line = $utf8->decode($line);
        next if not $line =~ m{ $target_strings }msx;
        $todo_of{$file_name}++;
    }

    close $file_handle or die "Error: $!\n";
}

sub sort_desc_from {
    my (%count_of) = @_;
    return sort { $count_of{$b} <=> $count_of{$a} } keys %count_of;
}

my $counter_str = $utf8->encode('頭！');

foreach my $file_name (sort_desc_from(%todo_of)) {
    say sprintf "%-50s = %2s${counter_str}",
                  $file_name,
                  $todo_of{$file_name};
}

use List::AllUtils qw{ sum };
my $total = sum(values %todo_of) || 0;
say $hr;
say $utf8->encode('ε(     v ﾟωﾟ) ＜ 見つかった TODO は、');
say $utf8->encode("ε(     v ﾟωﾟ) ＜ ${total}頭だよ！");

__END__

=head1 NAME

todo - トドちゃんを数えるスクリプト

=head1 SYNOPSIS

引数を省略すると、~/Dropbox/を調べる。

 % todo

第一引数にディレクトリ名を渡すと、そのディレクトリを調べる。

 % todo Documents/

=head1 DESCRIPTION

*.txtファイル及び*.mdファイルに対して、
ファイル内の“TODO: ”文字列ををカウントする。
“TODO: ”の合計件数も表示する。

※一行に複数の“TODO: ”が存在しても、カウントは一つ。

=head1 SEE ALSO

http://www.hyuki.com/d/200608.html#i20060818100343

=head1 AUTHOR

2008.08.18 hyuki
