use strict;
use warnings;

use Encode;
use Encode::JP::Emoji;
use Encode::JP::Emoji::FB_EMOJI_TEXT;
use JSON qw/encode_json decode_json/;

my $emojis = "😄😃😀😊☺😉😍😘😚😗😙😜😝😛😳😁😔😌😒😞😣😢😂😭😪😥😰😅😓😩😫😨😱😠😡😤😖😆😋😷😎😴😵😲😟😦😧😈👿😮😬😐😕😯😶😇😏😑👲👳👮👷💂👶👦👧👨👩👴👵👱👼👸😺😸😻😽😼🙀😿😹😾👹👺🙈🙉🙊💀👽💩🔥✨🌟💫💥💢💦💧💤💨👂👀👃👅👄👍👎👌👊✊✌👋✋👐👆👇👉👈🙌🙏☝👏💪🚶🏃💃👫👪👬👭💏💑👯🙆🙅💁🙋💆💇💅👰🙎🙍🙇🎩👑👒👟👞👡👠👢👕👔👚👗🎽👖👘👙💼👜👝👛👓🎀🌂💄💛💙💜💚❤💔💗💓💕💖💞💘💌💋💍💎👤👥💬👣💭🐶🐺🐱🐱🐹🐰🐸🐯🐨🐻🐷🐽🐮🐗🐵🐒🐴🐑🐘🐼🐧🐦🐤🐥🐣🐔🐍🐢🐛🐝🐜🐞🐌🐙🐚🐠🐟🐬🐳🐋🐄🐏🐀🐃🐅🐇🐉🐎🐐🐓🐕🐖🐁🐂🐲🐡🐊🐫🐪🐆🐈🐩🐾💐🌸🌷🍀🌹🌻🌺🍁🍃🍂🌿🌾🍄🌵🌴🌲🌳🌰🌱🌼🌐🌞🌝🌚🌑🌒🌓🌔🌕🌖🌗🌘🌜🌛🌙🌍🌎🌏🌋🌌🌠⭐☀⛅☁⚡☔❄⛄🌀🌁🌈🌊🎍💝🎎🎒🎓🎏🎆🎇🎐🎑🎃👻🎅🎄🎁🎋🎉🎊🎈🎌🔮🎥📷📹📼💿📀💽💾💻📱☎📞📟📠📡📺📻🔊🔉🔈🔇🔔🔕📢📣⏳⌛⏰⌚🔓🔒🔏🔐🔑🔎💡🔦🔆🔅🔌🔋🔍🛁🛀🚿🚽🔧🔩🔨🚪🚬💣🔫🔪💊💉💰💴💵💷💶💳💸📲📧📥📤✉📩📨📯📫📪📬📭📮📦📝📄📃📑📊📈📉📜📋📅📆📇📁📂✂📌📎✒✏📏📐📕📗📘📙📓📔📒📚📖🔖📛🔬🔭📰🎨🎬🎤🎧🎼🎵🎶🎹🎻🎺🎷🎸👾🎮🃏🎴🀄🎲🎯🏈🏀⚽⚾🎾🎱🏉🎳⛳🚵🚴🏁🏇🏆🎿🏂🏊🏄🎣☕🍵🍶🍼🍺🍻🍸🍹🍷🍴🍕🍔🍟🍗🍖🍝🍛🍤🍱🍣🍥🍙🍘🍚🍜🍲🍢🍡🍳🍞🍩🍮🍦🍨🍧🎂🍰🍪🍫🍬🍭🍯🍎🍏🍊🍋🍒🍇🍉🍓🍑🍈🍌🍐🍍🍠🍆🍅🌽🏠🏡🏫🏢🏣🏥🏦🏪🏩🏨💒⛪🏬🏤🌇🌆🏯🏰⛺🏭🗼🗾🗻🌄🌅🌃🗽🌉🎠🎡⛲🎢🚢⛵🚤🚣⚓🚀✈💺🚁🚂🚊🚉🚎🚆🚄🚅🚈🚇🚝🚋🚃🚎🚌🚍🚙🚘🚗🚕🚖🚛🚚🚨🚓🚔🚒🚑🚐🚲🚡🚟🚠🚜💈🚏🎫🚦🚥⚠🚧🔰⛽🏮🎰♨🗿🎪🎭📍🚩🇯🇵🇰🇷🇩🇪🇨🇳🇺🇸🇫🇷🇪🇸🇮🇹🇷🇺🇬🇧1⃣2⃣3⃣4⃣5⃣6⃣7⃣8⃣9⃣0⃣🔟🔢#⃣🔣⬆⬇⬅➡🔠🔡🔤↗↖↘↙↔↕🔄◀▶🔼🔽↩↪ℹ⏪⏩⏫⏬⤵⤴🆗🔀🔁🔂🆕🆙🆒🆓🆖📶🎦🈁🈯🈳🈵🈴🈲🉐🈹🈺🈶🈚🚻🚹🚺🚼🚾🚰🚮🅿♿🚭🈷🈸🈂Ⓜ🛂🛄🛅🛃🉑㊙㊗🆑🆘🆔🚫🔞📵🚯🚱🚳🚷🚸⛔✳❇❎✅✴💟🆚📳📴🅰🅱🆎🅾💠➿♻♈♉♊♋♌♍♎♏♐♑♒♓⛎🔯🏧💹💲💱©®™❌‼⁉❗❓❕❔⭕🔝🔚🔙🔛🔜🔃🕛🕧🕐🕜🕑🕝🕒🕞🕓🕟🕔🕠🕕🕡🕖🕢🕗🕣🕘🕤🕙🕥🕚🕦✖➕➖➗♠♥♣♦💮💯✔☑🔘🔗➰〰〽🔱◼◻◾◽▪▫🔺🔲🔳⚫⚪🔴🔵🔻⬜⬛🔶🔷🔸🔹";



sub String2Bytes {
    my $str = shift || return('');
    my $fmt = shift || '%02X';

    $str =~ s/(.)/sprintf($fmt, ord($1))/eg;
    $str =~ s/\n/0A/g;

    return($str);
}

sub _print_tr {
    my $id = shift;
    my $dec = shift;
    my $name = shift;
    my $codepoint = shift;
    my $utf8 = shift;
    my $utf16 = shift;
    my $docomo = shift;
    my $sb = shift;
    my $kddi = shift;


    print '<tr>';
    print '<td>'.$id.'</td>';
    print '<td><img src="img/'.$dec.'.png" /></td>';
    print '<td>'.$name.'</td>';
    print '<td><a href="http://www.fileformat.info/info/unicode/char/'.$codepoint.'/index.htm" target="_blank">'.$codepoint.'</a></td>';
    print '<td>'.String2Bytes($utf8).'</td>';
    print '<td>'.String2Bytes($utf16).'</td>';
    print '<td>'.String2Bytes($docomo).'</td>';
    print '<td>'.String2Bytes($sb).'</td>';
    print '<td>'.String2Bytes($kddi).'</td>';
    print '</tr>';
}


sub _print_table_header {
    my $title = shift;
    print << "EOF";
            <section id="$title">
            <h3>$title</h3>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>image</th>
                        <th>name</th>
                        <th>Unicode</th>
                        <th>UTF-8</th>
                        <th>UTF-16</th>
                        <th>docomo UTF-8</th>
                        <th>softbank UTF-8</th>
                        <th>kddi UTF-8</th>
                    </tr>
                </thead>

                <tbody>
EOF
}

sub _print_table_footer {
    print << "EOF";
                </tbody>
            </table>
            </section>
EOF
}

sub print_table {
    my @chars = @_;
    my $id = 1;

    _print_table_header('smiley');
    foreach my $c (@chars){
        my $codepoint = String2Bytes($c);
        my $dec = hex($codepoint);
        #print "wget http://www.charbase.com/images/glyph/".$dec;

        my $name = Encode::encode('x-utf8-e4u-none', $c, FB_EMOJI_TEXT());
        my $utf8 = Encode::encode('utf8', $c);
        my $utf16 = Encode::encode('utf16BE', $c);
        $c = Encode::encode('x-utf8-e4u-unicode', $c);
        my $google_emoji = Encode::decode('x-utf8-e4u-unicode', $c);
        my $docomo = Encode::encode('x-utf8-e4u-docomo', $google_emoji) || '';
        my $sb = Encode::encode('x-utf8-e4u-softbank3g', $google_emoji) || '';
        my $kddi = Encode::encode('x-utf8-e4u-kddiweb', $google_emoji) || '';
        $docomo = '' if ($utf8 eq $docomo);
        $sb = '' if ($utf8 eq $sb);
        $kddi = '' if ($utf8 eq $kddi);

        if ($codepoint eq '1F436') {
            _print_table_footer();
            _print_table_header('flower');
        }
        if ($codepoint eq '1F38D') {
            _print_table_footer();
            _print_table_header('bell');
        }
        if ($codepoint eq '1F3E0') {
            _print_table_footer();
            _print_table_header('vehicle');
        }
        if ($codepoint eq '31') {
            _print_table_footer();
            _print_table_header('number');
        }

        _print_tr($id, $dec, $name, $codepoint, $utf8, $utf16, $docomo, $sb, $kddi);
        #print_json($name, $codepoint, $utf8, $utf16, $docomo, $sb, $kddi);
        print "\n";

        $id += 1;
    }

    _print_table_footer();
}

sub _get_encoding_info {
    my $c = shift;

    my $info = {
        codepoint => String2Bytes($c),
        name => Encode::encode('x-utf8-e4u-none', $c, FB_EMOJI_TEXT()),
        utf8 => String2Bytes(Encode::encode('utf8', $c)),
        utf16 => String2Bytes(Encode::encode('utf16BE', $c)),
    };

    my $encoded_c = Encode::encode('x-utf8-e4u-unicode', $c);
    my $google_emoji = Encode::decode('x-utf8-e4u-unicode', $encoded_c);

    $info->{docomo} = Encode::encode('x-utf8-e4u-docomo', $google_emoji) || '';
    $info->{docomo} = '' if ($info->{utf8} eq $info->{docomo});
    $info->{docomo} = String2Bytes($info->{docomo});

    $info->{sb} = Encode::encode('x-utf8-e4u-softbank3g', $google_emoji) || '';
    $info->{sb} = '' if ($info->{utf8} eq $info->{sb});
    $info->{sb} = String2Bytes($info->{sb});

    $info->{kddi} = Encode::encode('x-utf8-e4u-kddiweb', $google_emoji) || '';
    $info->{kddi} = '' if ($info->{utf8} eq $info->{kddi});
    $info->{kddi} = String2Bytes($info->{kddi});

    # 後でJSONエンコードするためには、utf-8フラグを立てておく必要がある
    $info->{name} = decode_utf8($info->{name});
    return $info;
}

sub _is_keycap  {
    my $c = shift;
    my $codepoint = sprintf("%X", unpack("U2", $c));
    if ($codepoint eq "20E3") {
        return 1;
    }
    return 0;
}

sub _is_regional_indicator {
    my $c = shift;
    my $c_code = unpack("U2", $c);
    if (hex("1F1E6") <= $c_code && $c_code <= hex("1F1FF")) {
        return 1;
    }
    return 0;
}

sub _combine_info {
    my $previous = shift;
    my $present = shift;

    my $info = {
        codepoint => $previous->{codepoint} . $present->{codepoint},
        name => $previous->{name} . $present->{name},
        utf8 => $previous->{utf8} . $present->{utf8},
        utf16 => $previous->{utf16} . $present->{utf16},
        docomo => $previous->{docomo} . $present->{docomo},
        sb => $previous->{sb} . $present->{sb},
        kddi => $previous->{kddi} . $present->{kddi},
    };

    return $info;
}

sub print_as_json {
    my @chars = @_;

    my @info_list = ();
    my $is_coming_national_flag = 0;
    my $previous_info_nf;
    foreach my $c (@chars){
        my $info = _get_encoding_info($c);

        if (_is_keycap($c)) {
            #囲い文字なので、前の要素と結合する
            my $previous_info = pop(@info_list);
            $info = _combine_info($previous_info, $info);
        }
        elsif (1==_is_regional_indicator($c)) {
            # regional indicatorなので、次の文字と組で利用する
            if ($is_coming_national_flag==1) {
                # 2文字目なので、前の文字と結合して、infoを作る
                $info = _combine_info($previous_info_nf, $info);

                # 1文字目で保存した情報は不要なので初期化する
                $previous_info_nf = undef;
                $is_coming_national_flag = 0;
            }
            else {
                # 1文字目なので、infoをpushするのは次の文字に譲る
                $is_coming_national_flag = 1;
                $previous_info_nf = $info;
                next;
            }
        }
        else {
            $is_coming_national_flag = 0;
            $previous_info_nf = undef;
        }

        push(@info_list, $info);
    }
    print encode_json(\@info_list);
}

my $strings = Encode::decode('utf8', $emojis);
my @chars = split(//, $strings);

#print_table(@chars);
print_as_json(@chars);
