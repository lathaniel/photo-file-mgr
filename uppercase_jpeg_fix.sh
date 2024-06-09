for file in *.jpg; do
  mv "$file" "$(basename "$file" .jpg).JPG";
done
