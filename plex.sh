#/bin/bash

# Get all submodules and checkout to correct version before proceeding
git pull && git submodule init && git submodule update && git submodule status

# Set property file locations
PROPERTIES=plex.properties
PROPERTIES_EXAMPLE=$PROPERTIES.example

# Include example properties file to get defaults
. $PROPERTIES_EXAMPLE

# If user properties file does not exist, copy example
if [ ! -e $PROPERTIES ]
then
	echo "$PROPERTIES does not exist. Copying default $PROPERTIES_EXAMPLE."
	cp $PROPERTIES_EXAMPLE $PROPERTIES
fi

# Include user properties
. $PROPERTIES

# Build docker image
echo "Building docker image"
docker build -t plex docker-plex/

# Create config folder if it does not exist
if [ ! -e $CONFIG ]
then
	echo "$(realpath $CONFIG) does not exist, creating directory"
 	mkdir -p $CONFIG
fi
# Create data folder if it does not exist
if [ ! -e $DATA ]
then
	echo "$(realpath $DATA) does not exist, creating directory"
	mkdir -p $DATA
fi

# Run plex docker image
docker run -d -v $(realpath $CONFIG):/config -v $(realpath $DATA):/data -p $PORT:32400 plex
