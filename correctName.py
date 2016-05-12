# This script returns a human readable name for files record by DVBLink server 
#
# EXAMPLE:
# python correctName.py Zwei_Missionare-2014_20160512-302-1036000-1463076848.ts
#
# OUTPUT:
# Zwei Missionare.ts

import sys
import string

# get first argument
input = sys.argv[1]

# replace all underlines with spaces
output = string.replace(input, '_', ' ')

# split into list elements
output = string.split(output, '-')

# file name is the first element
filename = output[0]

extension = string.split(input, '.')
extension = extension[1]

print(filename + '.' + extension)

