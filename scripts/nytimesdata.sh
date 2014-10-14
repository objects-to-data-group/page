#!/bin/bash

#------------------------------------------------------------------------------#
  SCRIPT="nytimesdata.sh" # a variable...
  PURPOSE="Get the N.Y. Times datasets, mangle them to bits and say something meaningful about the results."
# Sidenote : Script is tested on MAC OS X only
#------------------------------------------------------------------------------#
# Institution : UvA
# Faculty : FGW
# Course : Culturele Informatiewetenschap (Media & Informatie)
# Subject : From Objects to Data
# Teacher : dr. M.A. Koolen
# Studyguide no. : 118210106Y
# Academic year : 2014 - 2015
#------------------------------------------------------------------------------#
# Authors : S. Bergmans, J. Lam, S. Wisselink, C. Sleutel and W. Nanninga
# Date : 24.09.2014
  VERSION="0.1"
#------------------------------------------------------------------------------#

#set -e # End the script if any statement returns a non-true return value
#set -u # End script if an unset variable is encountered.

# a very crude way of handling this...
# example: the script will exit if the directory allready exists.

echo "
Script Name: '$SCRIPT'
Purpose: '$PURPOSE'
Version '$VERSION'

This script will;

  - open the browser and show the datasets;

  - create a directory on your desktop with the name "nytimesdatasets";

  - then download the existing N.Y. Times datasets located at http://cleverdon.hum.uva.nl/marijn/OtD/nytimes/ ;

  - place the datasets into the created directory;

  - unzip and untar the files;

  - remove the zip and tarball files;

  - perform all kinds of other stuff we need it to do.
"


# open the users browser and navigate to the URI
open http://cleverdon.hum.uva.nl/marijn/OtD/nytimes/ && \

# lets point the path towards the desktop (MAC OS X) and create a directory named newyorktimesdatasets
mkdir ~/$USER_NAME/Desktop/newyorktimesdatasets && \

# copy code-master directory to new directory.
cp -R ~/$USER_NAME/Downloads/code-master ~/$USER_NAME/Desktop/newyorktimesdatasets && \

# direct the path towards the directory named newyorktimesdatasets
cd ~/$USER_NAME/Desktop/newyorktimesdatasets  && \

# copy the first file and give it the same name as the original
# we use curl because we cant assume the user has wget installed or want's to
curl http://cleverdon.hum.uva.nl/marijn/OtD/nytimes/nytimes_API_data.zip > nytimes_API_data.zip && \

# unzip the zipfile
unzip nytimes_API_data.zip  && \

# remove the zipfile from the directory
rm nytimes_API_data.zip && \

# copy the second file and give it the same name as the original
curl http://cleverdon.hum.uva.nl/marijn/OtD/nytimes/nytimes_web_data.tar.gz > nytimes_web_data.tar.gz && \

# untar the tarball
tar -zxvf nytimes_web_data.tar.gz && \

# remove the tarball from the directory
rm nytimes_web_data.tar.gz && \

exit 0
