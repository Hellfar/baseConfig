# TODO

## Installation

- Telegram
- Opera
- Quassel

- rails

## alias

## less

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
chmod u+x ~/.lessfilter

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

## screenlogger
