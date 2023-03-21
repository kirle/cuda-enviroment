#!/bin/bash

echo -n "Do you want to use the default settings? [y/n]: "
read default

if [ "$default" = "y" ] || [ "$default" = "Y" ]; then
    # Get the current username
    username=$(whoami)
    # Update the file with default settings
    sed -i "s|LD_LIBRARY_PATH: /home/.*|LD_LIBRARY_PATH: /home/$username/anaconda3/envs/tf/lib/|" conda-tf.yml
    sed -i "s|prefix: /home/.*|prefix: /home/$username/anaconda3/envs/tf|" conda-tf.yml
else
    # Ask for full LD_LIBRARY_PATH and prefix variables
    echo -n "Enter the full LD_LIBRARY_PATH: "
    read ld_library_path
    echo -n "Enter the prefix: "
    read prefix
    # Update the file with custom settings
    sed -i "s|LD_LIBRARY_PATH: /home/.*|LD_LIBRARY_PATH: $ld_library_path|" conda-tf.yml
    sed -i "s|prefix: /home/.*|prefix: $prefix|" conda-tf.yml
fi

echo "Creating Conda environment..."
conda env create -f conda-tf.yml
echo "Conda environment created"


