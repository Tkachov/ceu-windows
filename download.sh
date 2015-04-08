echo "Downloading $1:"
curl $2 -o $1.zip
unzip -q $1.zip
rm $1.zip
rename $1-* $1 $1-*