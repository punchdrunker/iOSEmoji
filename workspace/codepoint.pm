package Codepoint;

use strict;
use warnings;
use Encode;

# 文字列から文字コードを取得
sub String2Bytes {
    my $str = shift || return(undef);
    my $fmt = shift || '%X';

    $str =~ s/(.)/sprintf($fmt, ord($1))/eg;

    return($str);
}

#unicodeコードポイントから、utf16文字コードを取得
sub getUTF16 {
    my $string = shift || "";
    $string =~ s/ //g;
    $string=pack("H*",$string);
    Encode::from_to($string,"utf8","utf16");
    print unpack("H*",$string);
}

# utf8な文字からunicodeコードポイントを取得
sub utf8_to_unicode {
    my $string = shift || "";
    utf8::decode($string);
    return sprintf("U+%X\n", unpack("U2", $string));
}

# サロゲートペアをunicodeコードポイントに
sub surrogate_pair_to_unicode {
    my $hi = shift;
    my $lo = shift;
    my $uni = 0x10000 + (hex($hi) - 0xD800) * 0x400 + (hex($lo) - 0xDC00);
    return sprintf('U+%X', $uni);
}

1;
