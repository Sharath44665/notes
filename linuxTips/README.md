# Linux Tips:

### converting deb to rpm and install:

**Install alien:**

```
sudo dnf install alien
```

**Convert .deb to .rpm:**

```
sudo alien -r ./path-to-file.deb
```

**install .rpm file:**

```
sudo dnf install ./path-to-file.rpm
```

## Terminal Tricks

`CTRL + a` = to go at start of command/commands
 
`CTRL + e` = to go at end of command/commands

`CTRL + w` = delete command (backwards) word by word.

`ctrl + u` = delete everything in terminal

## creating desktop file

please note its a simple .desktop file

go to `~/.local/share/applications`, create `somethingSoftware.desktop` file copy paste and modify

``` shell
[Desktop Entry]
Version=1.0
Name=Eclipse
Comment=Description of the app
Exec=/home/sharath/Software/eclipse/eclipse
Icon=/home/sharath/Software/eclipse/icon.xpm
Terminal=false
Type=Application
```

