

#!/bin/bash
if [ -f $HOME/Documents/SoundFall/ES_Cara\ a\ Cara\ -\ Hugo\ Correia.ogg ]
then
    rm $HOME/Documents/SoundFall/ES_Cara\ a\ Cara\ -\ Hugo\ Correia.ogg
else
    :
fi
if [ -f $HOME/Documents/SoundFall/ES_Cara\ a\ Cara\ -\ Hugo\ Correia.bsaa ]
then
    rm $HOME/Documents/SoundFall/ES_Cara\ a\ Cara\ -\ Hugo\ Correia.bsaa
else
    :
fi
echo "Beginning conversion process"
sox "$1" "ES_Cara a Cara - Hugo Correia.ogg"
mv ES_Cara\ a\ Cara\ -\ Hugo\ Correia.ogg $HOME/Documents/SoundFall/
echo "Replacing ingame .ogg File"
cd $HOME/Documents/SoundFall
cp ES_Cara\ a\ Cara\ -\ Hugo\ Correia.ogg $HOME/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/common/SoundfallGame/BeatShooter/Content/Music/Biomes/Beach/Epidemic/ES_Cara\ a\ Cara\ -\ Hugo\ Correia.ogg
echo "Replacing ingame .bsaa File"
cp "$2" $HOME/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/common/SoundfallGame/BeatShooter/Content/AudioAnalysisCache/ES_Cara\ a\ Cara\ -\ Hugo\ Correia.bsaa
cp "$2" $HOME/Documents/SoundFall

# This script converts a custom music file ($1) into the .ogg file format (as it tends to yield better results when analysed by the game's AI) 
# and then renames & replaces the ingame file "ES_Cara a Cara - Hugo Correia.ogg" with the custom song ($1) as well as the BSAA analysis file ($2)
# generated for the map analysis of the song.
#
# This hack/mod effectively allows us to bypass the lock on Custom Songs when playing Online with other players
# as long as all players in the lobby share the same custom converted song ($1) and analysis for the map ($2) 
