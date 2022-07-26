
#!/bin/bash

echo "Starting clearing..."
mv $HOME/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/compatdata/1608700/pfx/drive_c/users/steamuser/AppData/Local/BeatShooter/Saved/AudioAnalysisCache/*.bsaa $HOME/Documents/soundFallBsaa
echo "Clearing done, all files moved to $HOME/Documents/soundFallBsaa."

# This script is used to clear all of the BSAA files from the folder used in-game SoundFall game and stores them in a more accessible folder in the user's $HOME.
