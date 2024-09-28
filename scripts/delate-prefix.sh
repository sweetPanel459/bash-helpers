#! /bin/bash

# declare -r pathThemes="/media/otpfullstack/Windows/cancionesuwu"
declare -r pathThemes="/home/otpfullstack/Descargas"
declare -a sortFilesNameList=()

prefix="y2mate.com - "

cd "$pathThemes" || exit

readarray -t listOfFiles < <(ls)

for songs in "${listOfFiles[@]}"; do
   sortFilesNameList+=("$songs")
   if [[ $songs == *$prefix* ]]; then
      trimmed="${songs#$prefix}"
      sudo mv "$songs" "$trimmed"
   fi
done
