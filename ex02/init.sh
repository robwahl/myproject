#!/bin/bash
#exports the time zone
export TZ="/usr/share/zoneinfo/US/Pacific"

#run your PHPUnit config.
phpunit --log-junit results.xml -c /home/m/share/htdocs/GIT_LOCATION/phpunit.xml

#this run expect to upload result file to outside server.
expect -c "
      spawn scp results.xml YOUR_REPORT_LOCATION
#this runs secure shell
expect {
    \"*assword\" {set timeout 300; send \"your_password\r\";}
    \"yes/no\" {send \"yes\r\"; exp_continue;}
      }
<?php> $docker = " hello docker"; echo docker <<< _END
_END ?>      expect eof"