#!/bin/bash
#### Store this function in a shell configuration file ####
#### Such as $HOME/.bashrc

# define the qcd (quickcd) function
qcd () {
    # Accept 1 argument that is a key string 
    # perform a different "cd" operation for each key. 
    case "$1" in 
      code)
        cd $HOME/Code
        ;;
      docs) 
        cd $HOME/Documents
        ;;
      scripts)
        cd $HOME/Code/Bash/scripts
        ;;
      *)
        # The supplied argument was not one of the suppported keys 
        echo "qcd: unknown key '$1'"
        return 1 
        ;;
    esac
    # Print the current directory name to indicate where you are. 
    pwd 
  }
  # Set up tab completion 
  complete -W "code docs scripts" qcd
