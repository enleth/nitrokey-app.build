## Signing

### Guide to sign bundles on OSX
1. Import key to keychain
2. Make sure your key is allowed to use [1] and it is not doubled in other key groups
3. Note name of the private key, best to save it to file, eg. `cat >
~/keyid2`, in this case this is "Nitrokey UG (haftungsbeschränkt)" or its HEX SHA
3. Run codesign on compiled Qt bundle (as long as qtdeploy's signing
feature is not working):

```
# sign all files in the bundle, each separately
codesign --deep --force --verify --verbose --sign "`cat ~/keyid2`"
"$APPFNAME"
# create DMG
bash ~/work/workaround/build/create-dmg.sh  "$APPFNAME" "$BRANCH"
# sign DMG (not sure of the effect)
codesign --deep --force --verify --verbose --sign "`cat ~/keyid2`"
"${APPFNAME}.dmg"
```
These commands are already included in `OSX/build.sh` build script.

### Signing on Windows
For code-signing Windows binary it is sufficent to run `Windows/codesign.cmd` script on Windows platform. Previously it is needed to dowbload signing tool from Microsoft site [3].
It is possible to make signing on Linux with [2] but this was not tested yet for our Application.

[1]
http://stackoverflow.com/questions/20205162/user-interaction-is-not-allowed-trying-to-sign-an-osx-app-using-codesign/22637896#22637896
[2] http://ilostmynotes.blogspot.com/2014/10/authenticode-signing-windows.html
[3] https://msdn.microsoft.com/en-us/library/aa387764.aspx
