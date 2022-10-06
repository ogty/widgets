number_of_mp3_file=$(ls ./static/music | grep -o -i .mp3 | wc -l)
i=1

echo '['
ls ./static/music | while read line; do
  if [[ $line == *.mp3 ]]; then
    if [ $i -eq $number_of_mp3_file ]; then
      echo "\"${line%.*}\""
    else
      echo "\"${line%.*}\","
    fi
    ((i++))
  fi
done
echo ']'
