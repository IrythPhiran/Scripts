

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
