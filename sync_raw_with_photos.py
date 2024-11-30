from glob import glob
import re
import os
from os.path import exists

def main():
    folder = '/home/adam/Pictures/2024-06-14 PNW/5D'
    raw_dir = 'RAW'
    jpg_dir = 'PHOTO'

    i = 0
    for raw_file in glob(f'{folder}/{raw_dir}/*.CR2'):
        if not exists(re.sub(raw_dir, jpg_dir, raw_file).replace('CR2','JPG')):
            i += 1
            print(f'Removing {raw_file}')
            os.remove(raw_file)
    
    print(f'Removed {i} files')
    
if __name__ == "__main__":
    main()
