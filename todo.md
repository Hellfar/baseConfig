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

## bashrc

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
