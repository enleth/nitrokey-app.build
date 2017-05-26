FNAME=$1
VER=$2
./create-dmg/create-dmg --volname "Nitrokey App" --window-pos 200 120 --window-size 800 400 --icon "Nitrokey App.app" 200 190 --app-drop-link 600 185 "Nitrokey App ${VER}.dmg"  "${FNAME}"
