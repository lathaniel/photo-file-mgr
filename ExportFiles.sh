# Change these two variables manually each time
input_dir="/media/adam/EOS_DIGITAL/DCIM"
photo_dir=/home/adam/Pictures
device=

declare -i file_count=0

for file_ext in *.JPG *.CR2 *.M*; do
    case $file_ext in
        "*.JPG")
            output_dir="PHOTO"
            ;;
        "*.CR2")
            output_dir="RAW"
            ;;
        "*.M*")
            output_dir="VIDEO"
            ;;
    esac
    # Get number of files on card
    # Adding -R flag to do all files in subfolders too
    num_files=$(find "$input_dir" -mindepth 1 -type f -iname "$file_ext" -printf x | wc -c)

    # Go through files and copy them to computer (keeping track throughout)
    find "$input_dir" -iname "$file_ext" -type f -print0 | while IFS= read -r -d '' x; do
        d=$(date -r "$x" +%Y-%m-%d)
        mkdir -p "$photo_dir/$d/$device/$output_dir"
        cp -u "$x" "$photo_dir/$d/$device/$output_dir/"
        file_count=$((file_count + 1))
        echo Copying file $file_count of $num_files \($file_ext\)
    done
done

read -p "Press any key to continue..."

# Delete empty directories
# rm -d "$photo_dir/$device/PHOTO" "$photo_dir/$device/VIDEO" "$photo_dir/$device/RAW"

# read -p "Press any key to continue..."
