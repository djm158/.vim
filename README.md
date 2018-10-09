# .vim
My personal vim configurations and plugins

Currently using [vim-plug](https://github.com/junegunn/vim-plug) for plugin management

## Installation

git clone https://github.com/djm158/.vim.git

## Configure plugins

```sh
$ cd ~/.vim
$ chmod +x install.sh
$ ./install.sh
```

## for typescript

add the binary path to node modules in `~/.profile`:

`PATH=~/.npm-global/bin:$PATH`

```sh
$ npm install -g typescript
```

## useful shortcuts i use a lot

| shorcut | description |
| -- | -- |
| `\ + g` | fuzzy find contents of all git files w/ preview |
| `ctrl + p` | fuzzy find all git files | 
| `\ + a` | fuzzy find files in current dir | 
| `\ + f` | recursive fuzzy find contents files in current dir | 
| `\ + v` | vsplit |
| `s` | open easy motion options (normal mode) |
