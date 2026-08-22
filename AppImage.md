# Guide on registering an AppImage as a Desktop Application
> https://dev.to/tqbit/how-to-register-an-appimage-as-a-desktop-application-in-linux-31c7

## Running an AppImage
An AppImage is a portable software application format that allows applications
to be run without the need to "install" them.

1. Run it directly through the terminal

> chmod +x mydownloaded.AppImage # init, one-time activity

> ./mydownloaded.AppImage

2. Register as a desktop application

- Download the AppImage and an associated logo
- Move the app to `/usr/local/bin`
> sudo mv ~/Downloads/mydownloaded.AppImage /usr/local/bin
- Make it executable  
> sudo chmod +x /usr/local/bin/mydownloaded.AppImage
- Save the logo under `/usr/local/share/icons`
> sudo mv ~/Downloads/appicon.png /usr/local/share/icons
- Create a desktop file
> touch /usr/local/share/applications/mydownloadedapp.desktop
- Write content similar to below in this .desktop file:
```
[Desktop Entry]
Type=Application
Version=3.3.0
Name=Notesnook
GenericName=Notetaking
Comment=Privacy-first note taking app
Icon=notesnook
OnlyShowIn=KDE
Exec=/usr/local/bin/notesnook_linux_x86_64.AppImage
Icon=notesnook
Categories=Utility;
Keywords=markdown;notes               # add searchable keywords
```


