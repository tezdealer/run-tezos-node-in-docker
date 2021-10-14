# run-tezos-node-in-docker
The purpose of this repo is to provide a quick way to sync and run a node on any platform using only Docker. Quickly import a full snapshot of Tezos data and run a Tezos node on **Windows**, Mac, Linux hosts using only Docker and Docker Compose.

# Prerequisites
Install Docker Engine and Docker Compose. For Windows users, simply install Docker Desktop, which contains all required software.
For convenience, also install git or GitHub Desktop to clone repo. (Alternatively, you can download a repo directly from GitHub by selecting 'Code' button, then 'Download Zip' option. Once saved, unzip to desired location on your machine.) The repo location on your machine will be used to store Tezos node data, so you'll want to remember this location.

# Run node
Once above prerequisites have been installed, you can run the node. On first run, full snapshot data will be retrieved and imported to get your node synced as quickly as possible. Edit the mainnet.env file to change provider of snapshot data if desired.

To run the node, use one of the startup scripts. Windows users will run start_mainnet.bat (double click to run). Mac and Linux users will run start_mainnet.sh.

# Files and their use
* start_mainnet.sh/start_mainnet.bat
  * Convenience scripts to run necessary docker-compose command to start the node
* mainnet.env
  * Contains environment variables that get used by docker-compose for the build and that can also be used to supply arguments to the app itself
* node-setup-from-snapshot.docker-compose.yml
  * docker-compose.yml files can be used to manage one or more containers that are intended to work together. It can also pass variables to the container that gets built.
* node.dockerfile
  * A Dockerfile builds a specific container from a specific image. In this case, this file is building upon the base tezos image.
* node-setup-from-snapshot.sh
  * The script that docker-compose will run in order to start the node. The snapshot import activity is managed in this script. Once snapshot has occured, this script will detect that data is present and will simply run the node. The iniitial snapshot retrieval and import process will take approximately 1-2 hours.

# Notes
Please feel free to edit all files as you see fit to suit your purposes. For example, you may want to change tezos node configuration. You could do that by adding necessary commands to node-setup-from-snapshot.sh or by copying a config file into the container or by directly running tezos config commands in an existing tezos node container (which will get created after you run the startup convenience script above).
