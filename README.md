Simple daily notes. The `note.sh` script does nothing more than open a text file for the current date in a specified directory, and maintaining headers like:

    ┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━┓
    ┃  ◀ 2021-03-28  ┃  2021-04-10  ┃  2021-04-11 ▶  ┃
    ┗━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━┛


This note taking "system" relies completly on the editor used. For `vim`, because the dates in the header corresponds to the file names, navigating to the previous or next note can be done with `gf`. Full-text search could be `:lgrep PATTERN %:h/*` where the results can be browsed by `:lopen`.

If you delete a note or otherwise need to update the headers, call `note.sh --reindex`.

By default the notes are written to `~/.note/`. This can be changed by setting the environment variable `NOTE_DIR`. To share notes between machines point `NOTE_DIR` to a directory with file synchronization, e.g.

    # ~/.bashrc

    export NOTE_DIR="$HOME/FileSync/NOTES"
    alias n='note.sh'

The editor opened respects the `EDITOR` environment variable, with `vim` as fallback.

