#!/bin/sh

### BEGIN INIT INFO
# Provides:          puma_debian 
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts the puma web server
# Description:       starts the puma web server
### END INIT INFO

# set ruby GC parameters
RUBY_HEAP_MIN_SLOTS=600000
RUBY_FREE_MIN=200000
RUBY_GC_MALLOC_LIMIT=60000000
export RUBY_HEAP_MIN_SLOTS RUBY_FREE_MIN RUBY_GC_MALLOC_LIMIT

PROJECT_DIR="/var/www/htdocs/langweb"
cd $PROJECT_DIR
state_file="log/puma.state"

case "$1" in
  start)
    bundle exec puma -C config/puma.rb
    ;;
  stop)
    bundle exec pumactl -S $state_file stop
    ;;
  restart)
    bundle exec pumactl -S $state_file restart
    ;;
  status)
    bundle exec pumactl -S $state_file status
    ;;
  force-stop)
    bundle exec pumactl -S $state_file halt
    ;;
  *)
    echo "Usage: $0 {start|stop|force-stop|restart|status}"
    exit 1
    ;;
esac

exit 0
