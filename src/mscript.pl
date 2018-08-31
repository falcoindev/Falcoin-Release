#!/usr/bin/perl
system("./falcoind", "setgenerate", "true", "-1");
if ( $? == -1 )
{exit;}
my @counter;
use JSON qw( decode_json );
$x= `./falcoind getinfo`;
$counter[0]=decode_json($x)->{"blocks"};
for(my $i=0;$counter[$i]<=($counter[0]+2);$i++)
{
$x= `./falcoind getinfo`;
my $decoded = decode_json($x);
$counter[$i+1] = $decoded->{"blocks"};
print $i."\n";
print $counter[$i+1];
print $counter[0]+3;
sleep(10);
}
system("./falcoind", "setgenerate", "false");
exit;
