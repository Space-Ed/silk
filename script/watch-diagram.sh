if [ ! -e $1 ]
then
  OUTPUT_TYPE=$1
else
  OUTPUT_TYPE='png'
fi

DIAGRAM_SOURCES='diagrams/src'
DIAGRAM_OUT="diagrams/$OUTPUT_TYPE"

#clean output directory
rm $DIAGRAM_OUT/*

function run_syntrax () {
  cat $source > $tmp
  cat "$DIAGRAM_SOURCES/links.py" >> $tmp
  syntrax -i $tmp -o $target -s diagrams/syntrax.ini --title=$name
  rm $tmp
}

function start_watch (){
  regex='^(.*)_syntax\.py'
  [[ $1 =~ $regex ]]
  name=$(echo ${BASH_REMATCH[1]})
  source="$DIAGRAM_SOURCES/$1"
  tmp="$DIAGRAM_SOURCES/tmp/$1.tmp"
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
