#!/bin/bash
#  findj.sh - recursively find jars containing specified Java classes and packages
#
# This Code is subject to the terms of the Mozilla Public License,
# v. 2.0. If a copy of the MPL was not distributed with this file, You can
# obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright Gavin C. Flower 2012
# gavinflower@archidevsys.co.nz
#
#  Usage:
#     First cd to the directory you want to search, the current directory
#     and sub directories will be searched for jar files.  Each jar file will be
#     checked.  When an interesting jar is found, the directory will be printed
#     first, then all the interesting jars.  For each interesting jar, every
#     matching class will be printed as a fully qualified name.
#
#     	(A)  	looking for a class name that ends in ServletResponse:
# 			findj.sh ServletResponse
#
#	  	(B)  	looking for an exact class name
#          		(prefix with a [/]):
#         	findj.sh /HttpServletResponse
#
#     	(C)  	looking for all classes in a package name,
#				ending in 'servlet.http'
#				(add the suffix [.*]):
#         	findj.sh servlet.http.*
#
#		(D) looking for all classes in a fully specified package name
#				(add prefix [' ] and suffix [.*']):
#			findj.sh ' javax.servlet.http.*'

function searchJars ()
{
	INDENT="\t"
	JAR_INTERESTING="f"
	declare -i COUNT

	for JAR in $2
	do
		if [ -f $JAR ]  # ignore symbolic links
		then
		    LINES=$(jar tf $JAR | egrep $CLASS)

		    COUNT=0
		    for LINE in $LINES
		    do
		    	if [ $COUNT -eq 0 ]
		    	then
		    		if [ $JAR_INTERESTING != "t" ]
		    		then
		    			# only print directory if we find an interesting jar
		    			echo $1
		    			JAR_INTERESTING="t"
		    		fi
		    		# only print jar name if it is of interest
		        	echo -e ${INDENT}$JAR
		    	fi

		        COUNT+=1
		        LINE=${LINE:0:${#LINE} -6}  # remove the trailing '.class'
		        LINE=${LINE//\//.}          # replace every '/' by '.'
		        echo -e ${INDENT}${INDENT}'('${COUNT}')  '$LINE  # display line indented, with a number
		    done
	    fi
	done
}

CLASS=$1.class
JAR_LIST=$(ls *.jar 2>/dev/null)

if [ "x$JAR_LIST" != "x" ]
then
	THIS_DIR=`pwd`
	searchJars $THIS_DIR "$JAR_LIST"
fi

DIR_LIST=$(ls -d * 2>/dev/null)

for DIR in $DIR_LIST
do
	if [ -d $DIR -a ! -h $DIR ]  # consider directories not symbolically linked
	then
		(
			cd $DIR
			findj.sh $1
		)
	fi
done
