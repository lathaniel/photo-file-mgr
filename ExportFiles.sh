# Change these two variables manually each time
directory=D:/DCIM/100EOS5D
device=5D

# Get number of files on card
# Adding -R flag to do all files in subfolders too
num_files=$(ls $directory/ -1q -R | wc -l)
declare -i file_count=0

# Go through files and copy them to computer (keeping track throughout)
for x in $directory/*.JPG; do
    d=$(date -r "$x" +%Y-%m-%d)
    mkdir -p "C:/Users/ALathan/Pictures/$d/$device/PHOTO"
    cp -u "$x" "C:/Users/ALathan/Pictures/$d/$device/PHOTO/"
    file_count=$((file_count + 1))
    echo Copying file $file_count of $num_files
done

for x in $directory/*.CR2; do
    d=$(date -r "$x" +%Y-%m-%d)
    mkdir -p "C:/Users/ALathan/Pictures/$d/$device/RAW"
    cp -u "$x" "C:/Users/ALathan/Pictures/$d/$device/RAW/"
    file_count=$((file_count + 1))
    echo Copying file $file_count of $num_files
done

for x in $directory/*.M*; do
    d=$(date -r "$x" +%Y-%m-%d)
    mkdir -p "C:/Users/ALathan/Pictures/$d/$device/VIDEO"
    cp -u "$x" "C:/Users/ALathan/Pictures/$d/$device/VIDEO/"
    file_count=$((file_count + 1))
    echo Copying file $file_count of $num_files
done

# Delete empty directories
rm -d "C:/Users/ALathan/Pictures/PHOTO" "C:/Users/ALathan/Pictures/VIDEO" "C:/Users/ALathan/Pictures/RAW"