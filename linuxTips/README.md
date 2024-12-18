# Linux Tips:

## Linux mint: disable alt + click

menu -> search for 'windows' -> click on behaviour -> **disable** special key to move and resize windows


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

## Postman Error:

**Error:**

>no such file or directory, open '/home/sharath/.config/Postman/proxy/postman-proxy-ca.crt'

**Fix** by installing openssl

```
sudo dnf install openssl
```

## Reduce the size of the image

## Reduce the size of photo:

`mogrify -quality 80% -resize 50% myphoto.jpg`

This command will reduce the quality of the image to 80% and resize it to 50% of its original size. You can adjust the quality and size parameters as per your requirements.

## How to Install MongoDB in Fedora:

Download the tar.gz file (amzon linux also works)

- create folder `/home/your username/new folder name/`
- extract `tar.gz` file
- `cd` to `bin` directory of mongodb extracted file
- run this command

```
./mongod --dbpath /home/your username/new folder name
```
- now mongodb server started.

### to check the above step:

- install mongodb compass or mongosh from official directory
- try connecting to mongodb compass or 
- use mongosh and type 

```
mongosh
```

- which will automatically connects to local server
- then type this:

```
show dbs;
```


