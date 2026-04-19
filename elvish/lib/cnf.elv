# ----------------------------------------------------------------------------
# Function alias for confX
# ----------------------------------------------------------------------------

var _edit = {|_file|
  e:vim -R $_file
}

fn shell { $_edit $E:ELVISH_CONF_DIR }
fn vim { e:vim -c 'execute "e ".expand("$MYVIMRC")' }
