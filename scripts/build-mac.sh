#!/bin/bash

app_dir=Cormas.app
resources_dir=$app_dir/Contents/Resources
macos_dir=$app_dir/Contents/MacOS

# Delete the old app directory and create a new one with subdirectories
rm -rf $app_dir
mkdir -p $app_dir/Contents/{Resources,MacOS}

# Create a temporary pharo/ directory and download Pharo image + VM
mkdir pharo
(cd pharo && curl https://get.pharo.org/120+vm | bash)

# Move Pharo VM to Contents/MacOS
mv pharo/pharo-vm $macos_dir/pharo-vm
mv pharo/{pharo,pharo-ui} $macos_dir

# Move Pharo image and other files to Contents/Resources
mv pharo/{Pharo.image,Pharo.changes,Pharo*.sources} $resources_dir

rm -rf pharo

# Install Cormas
./$macos_dir/pharo $resources_dir/Pharo.image eval "
    Metacello new
        repository: 'github://cormas/cormas/';
        baseline: 'Cormas';
        load.
    World closeAllWindowsDiscardingChanges.
    Smalltalk snapshot: true andQuit: true"

# Copy Cormas logo to be used as app logo
cp $resources_dir/pharo-local/iceberg/cormas/cormas/icons/icon_512x512@2x.png $resources_dir/logo.png

# Create a configuration file for the Mac app
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
<dict>
  <key>CFBundleName</key>
  <string>Cormas</string>
  <key>CFBundleExecutable</key>
  <string>cormas</string>
  <key>CFBundleIdentifier</key>
  <string>org.cormas</string>
  <key>CFBundleVersion</key>
  <string>0.95</string>
  <key>CFBundleIconFile</key>
  <string>logo.png</string>
</dict>
</plist>" > $app_dir/Contents/Info.plist

# Create an executable to run Cormas
echo "#!/bin/bash
pharo_vm=\"\$(dirname \"\$0\")\"/pharo-ui
pharo_image=\"\$(dirname \"\$0\")\"/../Resources/Pharo.image
./\$pharo_vm \$pharo_image" > $app_dir/Contents/MacOS/cormas

# Make it executable
chmod u+x $app_dir/Contents/MacOS/cormas