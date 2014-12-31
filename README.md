docker-plex
===========

This is a script to help you set up your (https://github.com/timhaak/docker-plex "plex docker") image - (https://github.com/timhaak/docker-plex). This script uses Tim Haak's docker-plex.

To install:
```
git clone https://github.com/timhaak/docker-plex.git
cd docker-plex
./plex.sh

```

This creates a folder called docker-plex in your PWD which contains the script to run the docker image. Optionally, you can add the script to your path by creating a symbolic link with the command:

```
ln -s $PWD/plex.sh /usr/local/bin/plex
```

This will allow you to manage plex anywhere.
