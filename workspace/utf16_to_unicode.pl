#!/opt/local/bin/perl
use strict;
use warnings;

use Encode;
use Encode::JP::Emoji;

use codepoint;

my @smiley = (
    '0xD83D 0xDE04',
    '0xD83D 0xDE0A',
    '0xD83D 0xDE03',
    '0x263A',
    '0xD83D 0xDE09',
    '0xD83D 0xDE0D',
    '0xD83D 0xDE18',
    '0xD83D 0xDE1A',
    '0xD83D 0xDE33',
    '0xD83D 0xDE0C',
    '0xD83D 0xDE01',
    '',

    '0xD83D 0xDE1C',
    '0xD83D 0xDE1D',
    '0xD83D 0xDE12',
    '0xD83D 0xDE0F',
    '0xD83D 0xDE13',
    '0xD83D 0xDE14',
    '0xD83D 0xDE1E',
    '0xD83D 0xDE16',
    '0xD83D 0xDE25',
    '0xD83D 0xDE30',
    '0xD83D 0xDE28',
    '',

    '0xD83D 0xDE23',
    '0xD83D 0xDE22',
    '0xD83D 0xDE2D',
    '0xD83D 0xDE02',
    '0xD83D 0xDE32',
    '0xD83D 0xDE31',
    '0xD83D 0xDE20',
    '0xD83D 0xDE21',
    '0xD83D 0xDE2A',
    '0xD83D 0xDE37',
    '0xD83D 0xDC7F',
    '',

    '0xD83D 0xDC7D',
    '0xD83D 0xDC9B',
    '0xD83D 0xDC99',
    '0xD83D 0xDC9C',
    '0xD83D 0xDC97',
    '0xD83D 0xDC9A',
    '0x2764',
    '0xD83D 0xDC94',
    '0xD83D 0xDC93',
    '0xD83D 0xDC98',
    '0x2728',
    '',

    '0xD83C 0xDF1F',
    '0xD83D 0xDCA2',
    '0x2755',
    '0x2754',
    '0xD83D 0xDCA4',
    '0xD83D 0xDCA8',
    '0xD83D 0xDCA6',
    '0xD83C 0xDFB6',
    '0xD83C 0xDFB5',
    '0xD83D 0xDD25',
    '0xD83D 0xDCA9',
    '',

    '0xD83D 0xDC4D',
    '0xD83D 0xDC4E',
    '0xD83D 0xDC4C',
    '0xD83D 0xDC4A',
    '0x270A',
    '0x270C',
    '0xD83D 0xDC4B',
    '0x270B',
    '0xD83D 0xDC50',
    '0xD83D 0xDC46',
    '0xD83D 0xDC47',
    '',

    '0xD83D 0xDC49',
    '0xD83D 0xDC48',
    '0xD83D 0xDE4C',
    '0xD83D 0xDE4F',
    '0x261D',
    '0xD83D 0xDC4F',
    '0xD83D 0xDCAA',
    '0xD83D 0xDEB6',
    '0xD83C 0xDFC3',
    '0xD83D 0xDC6B',
    '0xD83D 0xDC83',
    '',

    '0xD83D 0xDC6F',
    '0xD83D 0xDE46',
    '0xD83D 0xDE45',
    '0xD83D 0xDC81',
    '0xD83D 0xDE47',
    '0xD83D 0xDC8F',
    '0xD83D 0xDC91',
    '0xD83D 0xDC86',
    '0xD83D 0xDC87',
    '0xD83D 0xDC85',
    '0xD83D 0xDC66',
    '',

    '0xD83D 0xDC67',
    '0xD83D 0xDC69',
    '0xD83D 0xDC68',
    '0xD83D 0xDC76',
    '0xD83D 0xDC75',
    '0xD83D 0xDC74',
    '0xD83D 0xDC71',
    '0xD83D 0xDC72',
    '0xD83D 0xDC73',
    '0xD83D 0xDC77',
    '0xD83D 0xDC6E',
    '',

    '0xD83D 0xDC7C',
    '0xD83D 0xDC78',
    '0xD83D 0xDC82',
    '0xD83D 0xDC80',
    '0xD83D 0xDC63',
    '0xD83D 0xDC8B',
    '0xD83D 0xDC44',
    '0xD83D 0xDC42',
    '0xD83D 0xDC40',
    '0xD83D 0xDC43',
);

my @flower = (
    '0x2600',
    '0x2614',
    '0x2601',
    '0x26C4',
    '0xD83C 0xDF19',
    '0x26A1',
    '0xD83C 0xDF00',
    '0xD83C 0xDF0A',
    '0xD83D 0xDC31',
    '0xD83D 0xDC36',
    '0xD83D 0xDC2D',
    '',

    '0xD83D 0xDC39',
    '0xD83D 0xDC30',
    '0xD83D 0xDC3A',
    '0xD83D 0xDC38',
    '0xD83D 0xDC2F',
    '0xD83D 0xDC28',
    '0xD83D 0xDC3B',
    '0xD83D 0xDC37',
    '0xD83D 0xDC2E',
    '0xD83D 0xDC17',
    '0xD83D 0xDC35',
    '',

    '0xD83D 0xDC12',
    '0xD83D 0xDC34',
    '0xD83D 0xDC0E',
    '0xD83D 0xDC2B',
    '0xD83D 0xDC11',
    '0xD83D 0xDC18',
    '0xD83D 0xDC0D',
    '0xD83D 0xDC26',
    '0xD83D 0xDC24',
    '0xD83D 0xDC14',
    '0xD83D 0xDC27',
    '',

    '0xD83D 0xDC1B',
    '0xD83D 0xDC19',
    '0xD83D 0xDC20',
    '0xD83D 0xDC1F',
    '0xD83D 0xDC33',
    '0xD83D 0xDC2C',
    '0xD83D 0xDC90',
    '0xD83C 0xDF38',
    '0xD83C 0xDF37',
    '0xD83C 0xDF40',
    '0xD83C 0xDF39',
    '',

    '0xD83C 0xDF3B',
    '0xD83C 0xDF3A',
    '0xD83C 0xDF41',
    '0xD83C 0xDF43',
    '0xD83C 0xDF42',
    '0xD83C 0xDF34',
    '0xD83C 0xDF35',
    '0xD83C 0xDF3E',
    '0xD83D 0xDC1A',
);

my @bell = (
    '0xD83C 0xDF8D',
    '0xD83D 0xDC9D',
    '0xD83C 0xDF8E',
    '0xD83C 0xDF92',
    '0xD83C 0xDF93',
    '0xD83C 0xDF8F',
    '0xD83C 0xDF86',
    '0xD83C 0xDF87',
    '0xD83C 0xDF90',
    '0xD83C 0xDF91',
    '0xD83C 0xDF83',
    '',

    '0xD83D 0xDC7B',
    '0xD83C 0xDF85',
    '0xD83C 0xDF84',
    '0xD83C 0xDF81',
    '0xD83D 0xDD14',
    '0xD83C 0xDF89',
    '0xD83C 0xDF88',
    '0xD83D 0xDCBF',
    '0xD83D 0xDCC0',
    '0xD83D 0xDCF7',
    '0xD83C 0xDFA5',
    '',

    '0xD83D 0xDCBB',
    '0xD83D 0xDCFA',
    '0xD83D 0xDCF1',
    '0xD83D 0xDCE0',
    '0x260E',
    '0xD83D 0xDCBD',
    '0xD83D 0xDCFC',
    '0xD83D 0xDD0A',
    '0xD83D 0xDCE2',
    '0xD83D 0xDCE3',
    '0xD83D 0xDCFB',
    '',

    '0xD83D 0xDCE1',
    '0x27BF',
    '0xD83D 0xDD0D',
    '0xD83D 0xDD13',
    '0xD83D 0xDD12',
    '0xD83D 0xDD11',
    '0x2702',
    '0xD83D 0xDD28',
    '0xD83D 0xDCA1',
    '0xD83D 0xDCF2',
    '0xD83D 0xDCE9',
    '',

    '0xD83D 0xDCEB',
    '0xD83D 0xDCEE',
    '0xD83D 0xDEC0',
    '0xD83D 0xDEBD',
    '0xD83D 0xDCBA',
    '0xD83D 0xDCB0',
    '0xD83D 0xDD31',
    '0xD83D 0xDEAC',
    '0xD83D 0xDCA3',
    '0xD83D 0xDD2B',
    '0xD83D 0xDC8A',
    '',

    '0xD83D 0xDC89',
    '0xD83C 0xDFC8',
    '0xD83C 0xDFC0',
    '0x26BD',
    '0x26BE',
    '0xD83C 0xDFBE',
    '0x26F3',
    '0xD83C 0xDFB1',
    '0xD83C 0xDFCA',
    '0xD83C 0xDFC4',
    '0xD83C 0xDFBF',
    '',

    '0x2660',
    '0x2665',
    '0x2663',
    '0x2666',
    '0xD83C 0xDFC6',
    '0xD83D 0xDC7E',
    '0xD83C 0xDFAF',
    '0xD83C 0xDC04',
    '0xD83C 0xDFAC',
    '0xD83D 0xDCDD',
    '0xD83D 0xDCD6',
    '',

    '0xD83C 0xDFA8',
    '0xD83C 0xDFA4',
    '0xD83C 0xDFA7',
    '0xD83C 0xDFBA',
    '0xD83C 0xDFB7',
    '0xD83C 0xDFB8',
    '0x303D',
    '0xD83D 0xDC5F',
    '0xD83D 0xDC61',
    '0xD83D 0xDC60',
    '0xD83D 0xDC62',
    '',

    '0xD83D 0xDC55',
    '0xD83D 0xDC54',
    '0xD83D 0xDC57',
    '0xD83D 0xDC58',
    '0xD83D 0xDC59',
    '0xD83C 0xDF80',
    '0xD83C 0xDFA9',
    '0xD83D 0xDC51',
    '0xD83D 0xDC52',
    '0xD83C 0xDF02',
    '0xD83D 0xDCBC',
    '',

    '0xD83D 0xDC5C',
    '0xD83D 0xDC84',
    '0xD83D 0xDC8D',
    '0xD83D 0xDC8E',
    '0x2615',
    '0xD83C 0xDF75',
    '0xD83C 0xDF7A',
    '0xD83C 0xDF7B',
    '0xD83C 0xDF78',
    '0xD83C 0xDF76',
    '0xD83C 0xDF74',
    '',

    '0xD83C 0xDF54',
    '0xD83C 0xDF5F',
    '0xD83C 0xDF5D',
    '0xD83C 0xDF5B',
    '0xD83C 0xDF71',
    '0xD83C 0xDF63',
    '0xD83C 0xDF59',
    '0xD83C 0xDF58',
    '0xD83C 0xDF5A',
    '0xD83C 0xDF5C',
    '0xD83C 0xDF72',
    '',

    '0xD83C 0xDF5E',
    '0xD83C 0xDF73',
    '0xD83C 0xDF62',
    '0xD83C 0xDF61',
    '0xD83C 0xDF66',
    '0xD83C 0xDF67',
    '0xD83C 0xDF82',
    '0xD83C 0xDF70',
    '0xD83C 0xDF4E',
    '0xD83C 0xDF4A',
    '0xD83C 0xDF49',
    '',

    '0xD83C 0xDF53',
    '0xD83C 0xDF46',
    '0xD83C 0xDF45',
);

my @vehicle = (
    '0xD83C 0xDFE0',
    '0xD83C 0xDFEB',
    '0xD83C 0xDFE2',
    '0xD83C 0xDFE3',
    '0xD83C 0xDFE5',
    '0xD83C 0xDFE6',
    '0xD83C 0xDFEA',
    '0xD83C 0xDFE9',
    '0xD83C 0xDFE8',
    '0xD83D 0xDC92',
    '0x26EA',
    '',

    '0xD83C 0xDFEC',
    '0xD83C 0xDF07',
    '0xD83C 0xDF06',
    '0xD83C 0xDFE7',
    '0xD83C 0xDFEF',
    '0xD83C 0xDFF0',
    '0x26FA',
    '0xD83C 0xDFED',
    '0xD83D 0xDDFC',
    '0xD83D 0xDDFB',
    '0xD83C 0xDF04',
    '',

    '0xD83C 0xDF05',
    '0xD83C 0xDF03',
    '0xD83D 0xDDFD',
    '0xD83C 0xDF08',
    '0xD83C 0xDFA1',
    '0x26F2',
    '0xD83C 0xDFA2',
    '0xD83D 0xDEA2',
    '0xD83D 0xDEA4',
    '0x26F5',
    '0x2708',
    '',

    '0xD83D 0xDE80',
    '0xD83D 0xDEB2',
    '0xD83D 0xDE99',
    '0xD83D 0xDE97',
    '0xD83D 0xDE95',
    '0xD83D 0xDE8C',
    '0xD83D 0xDE93',
    '0xD83D 0xDE92',
    '0xD83D 0xDE91',
    '0xD83D 0xDE9A',
    '0xD83D 0xDE83',
    '',

    '0xD83D 0xDE89',
    '0xD83D 0xDE84',
    '0xD83D 0xDE85',
    '0xD83C 0xDFAB',
    '0x26FD',
    '0xD83D 0xDEA5',
    '0x26A0',
    '0xD83D 0xDEA7',
    '0xD83D 0xDD30',
    '0xD83C 0xDFB0',
    '0xD83D 0xDE8F',
    '',

    '0xD83D 0xDC88',
    '0x2668',
    '0xD83C 0xDFC1',
    '0xD83C 0xDF8C',
    '0xD83C 0xDDEF 0xD83C 0xDDF5',
    '0xD83C 0xDDF0 0xD83C 0xDDF7',
    '0xD83C 0xDDE8 0xD83C 0xDDF3',
    '0xD83C 0xDDFA 0xD83C 0xDDF8',
    '0xD83C 0xDDEB 0xD83C 0xDDF7',
    '0xD83C 0xDDEA 0xD83C 0xDDF8',
    '0xD83C 0xDDEE 0xD83C 0xDDF9',
    '',

    '0xD83C 0xDDF7 0xD83C 0xDDFA',
    '0xD83C 0xDDEC 0xD83C 0xDDE7',
    '0xD83C 0xDDE9 0xD83C 0xDDEA',
);

my @number = (
    '0x0031 0x20E3',
    '0x0032 0x20E3',
    '0x0033 0x20E3',
    '0x0034 0x20E3',
    '0x0035 0x20E3',
    '0x0036 0x20E3',
    '0x0037 0x20E3',
    '0x0038 0x20E3',
    '0x0039 0x20E3',
    '0x0030 0x20E3',
    '0x0023 0x20E3',
    '',

    '0x2B06',
    '0x2B07',
    '0x2B05',
    '0x27A1',
    '0x2197',
    '0x2196',
    '0x2198',
    '0x2199',
    '0x25C0',
    '0x25B6',
    '0x23EA',
    '',

    '0x23E9',
    '0xD83C 0xDD97',
    '0xD83C 0xDD95',
    '0xD83D 0xDD1D',
    '0xD83C 0xDD99',
    '0xD83C 0xDD92',
    '0xD83C 0xDFA6',
    '0xD83C 0xDE01',
    '0xD83D 0xDCF6',
    '0xD83C 0xDE35',
    '0xD83C 0xDE33',
    '',

    '0xD83C 0xDE50',
    '0xD83C 0xDE39',
    '0xD83C 0xDE2F',
    '0xD83C 0xDE3A',
    '0xD83C 0xDE36',
    '0xD83C 0xDE1A',
    '0xD83C 0xDE37',
    '0xD83C 0xDE38',
    '0xD83C 0xDE02',
    '0xD83D 0xDEBB',
    '0xD83D 0xDEB9',
    '',

    '0xD83D 0xDEBA',
    '0xD83D 0xDEBC',
    '0xD83D 0xDEAD',
    '0xD83C 0xDD7F',
    '0x267F',
    '0xD83D 0xDE87',
    '0xD83D 0xDEBE',
    '0x3299',
    '0x3297',
    '0xD83D 0xDD1E',
    '0xD83C 0xDD94',
    '',

    '0x2733',
    '0x2734',
    '0xD83D 0xDC9F',
    '0xD83C 0xDD9A',
    '0xD83D 0xDCF3',
    '0xD83D 0xDCF4',
    '0xD83D 0xDCB9',
    '0xD83D 0xDCB1',
    '0x2648',
    '0x2649',
    '0x264A',
    '',

    '0x264B',
    '0x264C',
    '0x264D',
    '0x264E',
    '0x264F',
    '0x2650',
    '0x2651',
    '0x2652',
    '0x2653',
    '0x26CE',
    '0xD83D 0xDD2F',
    '',

    '0xD83C 0xDD70',
    '0xD83C 0xDD71',
    '0xD83C 0xDD8E',
    '0xD83C 0xDD7E',
    '0xD83D 0xDD32',
    '0xD83D 0xDD34',
    '0xD83D 0xDD33',
    '0xD83D 0xDD5B',
    '0xD83D 0xDD50',
    '0xD83D 0xDD51',
    '0xD83D 0xDD52',
    '',

    '0xD83D 0xDD53',
    '0xD83D 0xDD54',
    '0xD83D 0xDD55',
    '0xD83D 0xDD56',
    '0xD83D 0xDD57',
    '0xD83D 0xDD58',
    '0xD83D 0xDD59',
    '0xD83D 0xDD5A',
    '0x2B55',
    '0x274C',
    '0x00A9',
    '',

    '0x00AE',
    '0x2122',
);




print_sb_unicode(@smiley);

sub print_sb_unicode {
    my @emojis = @_;
    my $unicode_string = "";
    print "<tr>\n<td>SB Unicode</td>\n";
    for my $emoji (@emojis) {
        my @array = split(/\s/, $emoji);
        if ($#array==1) {
            if (hex($array[0]) <= 57) {
                $unicode_string = pack('U*', hex($array[0]));
                $unicode_string .= pack('U*', hex($array[1]));
            }
            else {
                my $unicode = Codepoint::surrogate_pair_to_unicode(@array, '%02X');
                $unicode_string = pack('U*', hex($unicode));
            }
        }
        elsif ($#array==3) {
            my $region1 = Codepoint::surrogate_pair_to_unicode($array[0], $array[1], '%02X');
            $region1 = pack('U*', hex($region1));
            my $region2 =  Codepoint::surrogate_pair_to_unicode($array[2], $array[3], '%02X');
            $region2 = pack('U*', hex($region2));
            $unicode_string = $region1 . $region2;
        }
        elsif ($emoji ne '') {
            $emoji =~ s/0x//;
            $unicode_string = pack('U*', hex($emoji));
        }
        if ($emoji eq '') {
            print "</tr>\n\n";
            print "<tr>\n<td>SB Unicode/td>\n";
        }
        else {
            my $sb_unicode = Codepoint::unicode_to_sb_unicode($unicode_string);
            print "<td>$sb_unicode</td>\n";
        }
    }
}

sub print_unicode {
    my @emojis = @_;
    for my $emoji (@emojis) {
        my @array = split(/\s/, $emoji);
        if ($#array==1) {
            print Codepoint::surrogate_pair_to_unicode(@array);
        }
        elsif ($#array==3) {
            print Codepoint::surrogate_pair_to_unicode($array[0], $array[1]);
            print ' ';
            print Codepoint::surrogate_pair_to_unicode($array[2], $array[3]);
        }
        else {
            $emoji =~ s/0x/U+/;
            print $emoji;
        }
        print "\n";
    }
}

#$utf8 = "\xF0\x9F\x95\x9A";
#Encode::from_to($utf8, 'x-utf8-e4u-unicode', 'x-utf8-e4u-softbank3g');
#my $sb_unicode = Codepoint::utf8_to_unicode($utf8, '%02X');
#print $sb_unicode;
#print "\n";
#exit;


#my $_unicode = Codepoint::surrogate_pair_to_unicode('0xD83D', '0xDD5A', '%02X');
#my $_unicode_string = pack('U*', hex($_unicode));
#print Codepoint::unicode_to_sb_unicode($_unicode_string);
#print "\n";
#exit;
