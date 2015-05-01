#!/bin/csh
#
cd /tmp
df -h > diskspace.txt
df -hP | grep % | gawk 'BEGIN { FS = " " } {print $5 }' | grep -v se | sed  's/%$//' > rawnums.txt
foreach i (`cat /tmp/rawnums.txt`)
  if ( $i > 90 ) then
        mailx -s "Disk filling up..." user@domain.com < /tmp/diskspace.txt
  endif
end
#
# You can tell what system it's from by looking at the "from" on the email...
#
