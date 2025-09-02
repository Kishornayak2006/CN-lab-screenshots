set ns [new Simulator] 
set nf [open sampleprog3.nam w]
$ns namtrace-all $nf
set tf [open sampleprog3.tr w]
$ns trace-all $tf
proc finish {} {
   global ns nf tf
   $ns flush-trace
   close $nf
   close $tf
   exec nam sampleprog3.nam &
   exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

$n0 label "TCP source node"
$n1 label "UDP source node"
$n2 label "router node"
$n3 label "destination node"

$ns duplex-link $n0 $n2 10mb 10ms DropTail
$ns duplex-link $n1 $n2 10kb 100ms DropTail
$ns duplex-link $n2 $n3 10kb 100ms DropTail

set tcp [new Agent/TCP]
$ns attach-agent $n0 $tcp

set sink  [new Agent/TCPSink]
$ns attach-agent $n3 $sink

set ftp [new Application/FTP]
$ftp attach-agent $tcp

set udp [new Agent/UDP]
$ns attach-agent $n1 $udp

set null [new Agent/Null]
$ns attach-agent $n3 $null

set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp
$ns connect $tcp $sink
$ns connect $udp $null
$ftp set packetSize_ 200
$ftp set interval_ 0.01
$cbr set packetSize_ 300
$cbr set interval_ 0.001

$ns at 0.1 "$cbr start"
$ns at 0.3 "$ftp start"
$ns at 5.0 "$cbr stop"
$ns at 5.0 "$ftp stop"
$ns at 10.0 "finish"
$ns run   
