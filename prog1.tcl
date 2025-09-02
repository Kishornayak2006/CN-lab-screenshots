set ns [new Simulator]

set nf [open prog1.nam w]
$ns namtrace-all $nf

set tf [open prog1.tr w]
$ns trace-all $tf

proc finish {} {
    global ns nf tf
    $ns flush-trace
    close $nf
    close $tf
    exec nam prog1.nam &
    exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]

$n0 label "source node"
$n1 label "Router node"
$n2 label "destination node"

$ns duplex-link $n0 $n1 1Mb 10ms DropTail

$ns duplex-link $n1 $n2 10kb 50ms DropTail

$ns queue-limit $n0 $n1 10

$ns queue-limit $n1 $n2 10

set tcp [new Agent/TCP]
$ns attach-agent $n0 $tcp

set ftp [new Application/FTP]
$ftp attach-agent $tcp

set sink [new Agent/TCPSink] ;
$ns attach-agent $n2 $sink

$ns connect $tcp $sink

$ns at 0.1 "$ftp start"

$ns at 1.0 "finish"

$ns run
