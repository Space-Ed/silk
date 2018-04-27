
OUTPUT_TYPE=$1
DIAGRAM_SOURCES='diagrams/src'
DIAGRAM_OUT="diagrams/$OUTPUT_TYPE"

function run_syntrax () {
  syntrax -i $source -o $target -s syntrax.ini > $log
}

function start_watch (){
  name=$(echo $1 | cut -d '.' -f 1)
  source="$DIAGRAM_SOURCES/$1"
  target="$DIAGRAM_OUT/$name.$OUTPUT_TYPE"
  log=$name.log

  run_syntrax

  inotifywait -m -e modify $source | (
      while read;
      do
        run_syntrax
      done
  ) &

  xdg-open $target
}

function end_watches {
  killall inotifywait
  exit 1
}

ls $DIAGRAM_SOURCES | grep "syntax.py" | (
  while read line; do
    echo "Starting Watch for" $line;
    start_watch $line
  done
)

trap 'end_watches' SIGINT

while :
do
  sleep 1;
done;
