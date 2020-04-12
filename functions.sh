function datemov {
    originaldate=$(exiftool -s -time:CreationDate $1)
    cleandate=$(echo -e "${originaldate}" | tr -d '[:space:][":"]')
    finaldate=$(echo $cleandate | cut -c13-24)
    finalsec=$(echo $cleandate | cut -c25-26)
    touch -t $finaldate.$finalsec $1
}

function datemp4 {
  originaldate=$(exiftool -s -time:CreateDate $2)
  cleandate=$(echo "${originaldate}" | tr -d '[:space:][":"]')
  y=$(echo $cleandate | cut -c11-14)
  m=$(echo $cleandate | cut -c15-16)
  d=$(echo $cleandate | cut -c17-18)
  h=$(echo $cleandate | cut -c19-20)
  mn=$(echo $cleandate | cut -c21-22)
  s=$(echo $cleandate | cut -c23-24)
  delta=$1
  difh=$((h-delta))
  zero=0
  if [ $difh -lt $zero ]
  then
    h=$((24+difh))
    d=$((d-1))
  else
    h=$((h-delta))
  fi
  if [ echo ${#d} == 1 ]
  then 
    d=$(printf '%02d' $d)
  fi 
  echo "The new CREATED/MODIFIED DATE will be: (Y/M/D h:m:s)" $y-$m-$d $h:$mn:$s
  touch -t $y$m$d$h$mn.$s $2
}
