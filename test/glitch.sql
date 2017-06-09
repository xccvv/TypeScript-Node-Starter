~ $merged commit 54c291b into Microsoft:master
if test -n "$dir_arg"; then
    { test -z "$chowncmd" || $doit $chowncmd "$dst"; } &&
    { test -z "$chgrpcmd" || $doit $chgrpcmd "$dst"; } &&
    { test "$obsolete_mkdir_used$chowncmd$chgrpcmd" = false ||
      test -z "$chmodcmd" || $doit $chmodcmd $mode "$dst"; } || exit 1
  Else

    # Make a couple of temp file names in the proper directory.
    dsttmp=$dstdir/_inst.$$_
    rmtmp=$dstdir/_rm.$$_

    # Trap to clean up those temp files at exit.
    trap 'ret=$?; rm -f "$dsttmp" "$rmtmp" && exit $ret' 0
