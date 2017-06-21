set -x $TMUX_ENVS_DIR $PEARL_PKGVARDIR

if [ -n "$TMUX" ]
    set TMUX_SESSION_NAME (tmux display-message -p '#S')
    set TMUX_WINDOW_INDEX (tmux display-message -p '#I')
    set TMUX_PANE_INDEX (tmux display-message -p '#P')
    [ -f $TMUX_ENVS_DIR/default ]; and source $TMUX_ENVS_DIR/default
    [ -f $TMUX_ENVS_DIR/$TMUX_SESSION_NAME ]; and source $TMUX_ENVS_DIR/$TMUX_SESSION_NAME
end
# vim: ft=sh
