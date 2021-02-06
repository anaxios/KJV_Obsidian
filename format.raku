#!/usr/bin/env raku


for dir('KJV') -> $file {
    $file.open(:r);
    my $output = open( "/Users/sophronios/kjv-obsidian/v1/" ~ $file.parts.basename,:a);
    for $file.lines -> $line {
	my regex verse { ^"-"\s+(\d+) };
	my $trimline = $line.trim;
	$trimline = $trimline.subst(/\"/,"",:g);
	$trimline = $trimline ~ " ^$0" if $trimline ~~ &verse;
#	$trimline if $trimline !~~ &verse;
	$output.say($trimline);

    }
    $output.close;
    #$file.close;
}
