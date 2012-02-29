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

# utf8な文字からunicodeコードポイントを取得
sub utf8_to_unicode {
    my $string = shift || "";
    my $format = shift || "U+%X\n";
    utf8::decode($string);
    return sprintf($format, unpack("U2", $string));
}

# サロゲートペアをunicodeコードポイントに
# surrogate_pair_to_unicode('0xD83D 0xDD53')
# => 'U+1F55A'
sub surrogate_pair_to_unicode {
    my $hi = shift;
    my $lo = shift;
    my $format = shift || 'U+%X';
    my $uni = 0x10000 + (hex($hi) - 0xD800) * 0x400 + (hex($lo) - 0xDC00);
    return sprintf($format, $uni);
}

#
sub code_to_string {
    my $code = shift;
    $code =~ s/0x([[:xdigit:]]{4})/pack('H*',$1)/geo;
    return $code; 
}

# usage:
# unicode_to_sb_unicode('\xF0\x9F\x95\x9A')
# => 'E02E'
sub unicode_to_sb_unicode {
    my $unicode = shift || "";
    my $octets = Encode::encode('utf8', $unicode);
    my $google_emoji = Encode::decode('x-utf8-e4u-unicode', $octets);
    my $_sb = Encode::encode('x-utf8-e4u-softbank3g', $google_emoji);
    return utf8_to_unicode($_sb, "%02X");
}

1;
