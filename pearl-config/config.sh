export TMUX_ENVS_DIR="$PEARL_PKGVARDIR"

if [ -n "$TMUX" ]; then
    TMUX_SESSION_NAME=$(tmux display-message -p '#S')
    TMUX_WINDOW_INDEX=$(tmux display-message -p '#I')
    TMUX_PANE_INDEX=$(tmux display-message -p '#P')
    [ -f $TMUX_ENVS_DIR/default ] && source $TMUX_ENVS_DIR/default
    [ -f $TMUX_ENVS_DIR/$TMUX_SESSION_NAME ] && source $TMUX_ENVS_DIR/$TMUX_SESSION_NAME
fi
# vim: ft=sh
