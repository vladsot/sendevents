#!/bin/bash

IP=`echo -n "10."; echo -n $(( $RANDOM % 256 +1 )); echo -n "."; echo -n $(( $RANDOM % 256 +1 )); echo -n "."; echo -n $(( $RANDOM % 256 +1 ))`
IP2=`echo -n "10."; echo -n $(( $RANDOM % 256 +1 )); echo -n "."; echo -n $(( $RANDOM % 256 +1 )); echo -n "."; echo -n $(( $RANDOM % 256 +1 ))`

MAC1=`printf '%02X-%02X-%02X-%02X-%02X-%02X\n' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256] $[RANDOM%256] $[RANDOM%256] $[RANDOM%256]`
MAC2=`printf '%02X-%02X-%02X-%02X-%02X-%02X\n' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256] $[RANDOM%256] $[RANDOM%256] $[RANDOM%256]`
MAC3=`printf '%02X-%02X-%02X-%02X-%02X-%02X\n' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256] $[RANDOM%256] $[RANDOM%256] $[RANDOM%256]`
MAC4=`printf '%02X-%02X-%02X-%02X-%02X-%02X\n' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256] $[RANDOM%256] $[RANDOM%256] $[RANDOM%256]`

tempdir=`mktemp -d`
echo '172.16.222.222:<133>1 2021-11-08T15:34:45.000Z  FortiEDR - - - Message Type: Security Event;Organization: Presto;Organization ID: 2792972;Event ID: 9057671;Raw Data ID: 3936026595;Device Name: prx1work01;Device State: Running;Operating System: Red Hat Enterprise Linux Server 7.9;Process Name: bash;Process Path: /bin/bash;Process Type: 64bit;Severity: High;Classification: Inconclusive;Destination: ${IP};First Seen: 08-Nov-2021, 05:38:45;Last Seen: 08-Nov-2021, 07:34:45;Action: Blocked (Simulation);Count: 59;Certificate: no;Rules List: Tampered Executable - Critical Executable was Tampered With,Unconfirmed Executable - Executable File Failed Verification Test;Users: ;MAC Address: ${MAC1},${MAC2},${MAC3},${MAC4};Script: job-submit.sh;Script Path: N/A;Autonomous System: N/A;Country: N/A;Process Hash: N/A;Source IP: ${IP2}'>$tempdir/events_EDR.dat

./sendEvents -r 1 -l 1 -d 172.30.59.131 -m $tempdir

rm -rf $tempdir
