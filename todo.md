# TODO

## Installation

- retext python3-docutils python3-markdown
- meld

- redshift
- Telegram
- Opera
- Quassel

- node
- R
- Ruby
- rails

- atom
- Gitkraken

- sudo npm install -g node-static

## Alias

- `R="R --no-save"`
- `log="less -W +F"`

## bashrc

history=-1

```
man () {
  case "$(type -t "$1"):$1" in
    builtin:*) help "$1" | "${PAGER:-less}";;     # built-in
    *[[?*]*) help "$1" | "${PAGER:-less}";;       # pattern
    *) command -p man "$@";;  # something else, presumed to be an external command
                              # or options for the man command or a section number
  esac
}
```

[https://superuser.com/questions/117841/get-colors-in-less-or-more](https://superuser.com/questions/117841/get-colors-in-less-or-more)
