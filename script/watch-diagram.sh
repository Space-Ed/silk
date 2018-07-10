if [ ! -e $1 ]
then
  OUTPUT_TYPE=$1
else
  OUTPUT_TYPE='png'
fi

if [ ! -e $2 ]
then
  FILE_NAME=$2
else
  FILE_NAME='all'
fi

DO_OUT=$3
DO_WATCH=$4

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

  if [ $name == $FILE_NAME -o $FILE_NAME == 'all' ]; then
    run_syntrax

    if [ "$DO_WATCH" == '-w' ]; then
      echo "Starting Watch for" $1;
      inotifywait -m -e modify $source | (
          while read;
          do
            run_syntrax
          done
      ) &
    fi

    if [ "$DO_OUT" == '-o' ]
    then
      echo "opening target file $target"
      xdg-open $target
    fi

  fi
}

function end_watches {
  killall inotifywait
  exit 1
}

ls $DIAGRAM_SOURCES | grep "syntax.py" | (
  while read line; do
    start_watch $line
  done
)

trap 'end_watches' SIGINT

while :
do
  sleep 1;
done;
