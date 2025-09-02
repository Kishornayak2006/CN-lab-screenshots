set ns [new Simulator]
set nf [open P1.nam w]
$ns namtrace-all $nf
set tf [open P1.tr w]
$ns trace-all $tf

proc finish {} {
    global ns nf tf  
    $ns flush-trace
    close $nf
    close $tf
    exec nam P1.nam &
    exit 0
}

set n0 [$ns node]
set n1 [$ns node]

$ns duplex-link $n0 $n1 100mbps 10ms DropTail
$ns queue-limit $n0 $n1 10

set tcp0 [new Agent/TCP]
$ns attach-agent $n0 $tcp0

set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0

set sink1 [new Agent/TCPSink] ;
$ns attach-agent $n1 $sink1

$ns connect $tcp0 $sink1

$ns at 0.1 "$ftp0 start"
;
$ns at 1.0 "finish"

$ns run
