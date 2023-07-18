from glob import glob
import re
import os
from os.path import exists

def main():
    folder = 'Ralph Ln STR Listing'
    raw_dir = 'RAW'
    jpg_dir = 'PHOTO'

    i = 0
    for raw_file in glob(f'c:/users/alathan/pictures/{folder}/{raw_dir}/*.CR2'):
        if not exists(re.sub(raw_dir, jpg_dir, raw_file).replace('CR2','JPG')):
            i += 1
            os.remove(raw_file)
    
    print(f'Removed {i} files')
    
if __name__ == "__main__":
    main()