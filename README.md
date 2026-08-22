# kderc
A hodgepodge of quick KDE UI fixes and application prefs.
Here's a jumbled assortment of fixes and tweaks made to my KDE -
> Disclaimer: It is intended to be modified with future changes; current files may/not work on all DEs.

## startup
```sh
./startup.sh
```

## terminal ui
| Light Mode | Dark Mode |
|:----------:|:---------:|
| ![Light Mode](ss/light_mode.png) | ![Dark Mode](ss/dark_mode.png) |

Involved a heavy usage of background scripts and cron jobs and lots of learnings; looks cool though.

## vimrc
Vim is a super-powerful IDE, immensely tweakable. Sharing my vimrc for reference in this repo.
- **Persistent editor**: users can undo with previous changes everytime  they open a file.
- **Search**: highlights are closed with `,<SPACE>`
- **NerdTree**: toggles with F2, closed initially
- **cursor**: highlighted with `/c`, absent initially

```sh
cp vimrc ~/.vimrc
```

## shell
![image](./ss/zsh_shell.png)
`aliases.zsh` and `zsh.sh` are attached

```sh
./zsh.sh
```

## light/dark mode switch
The light/dark mode switch was intended from early on. Times are intended to sync to sunrise/sunset for these apps:
- Global theme
- Files/folders
- editor; **vim**
- Browser

Ref: **Koi** [https://github.com/baduhai/Koi)]

> Ref: AppImage.md

