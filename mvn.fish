function mvn --description "Colorize maven output"
  if not type -q mvn
    echo "Please install Apache Maven first!"; return 1
  end

  # tput usage: http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x405.html
  set BOLD (tput bold)
  set UNDERLINE_ON (tput smul)
  set UNDERLINE_OFF (tput rmul)
  set TEXT_BLACK (tput setaf 0)
  set TEXT_RED (tput setaf 1)
  set TEXT_GREEN (tput setaf 2)
  set TEXT_YELLOW (tput setaf 3)
  set TEXT_BLUE (tput setaf 4)
  set TEXT_MAGENTA (tput setaf 5)
  set TEXT_CYAN (tput setaf 6)
  set TEXT_WHITE (tput setaf 7)
  set BACKGROUND_BLACK (tput setab 0)
  set BACKGROUND_RED (tput setab 1)
  set BACKGROUND_GREEN (tput setab 2)
  set BACKGROUND_YELLOW (tput setab 3)
  set BACKGROUND_BLUE (tput setab 4)
  set BACKGROUND_MAGENTA (tput setab 5)
  set BACKGROUND_CYAN (tput setab 6)
  set BACKGROUND_WHITE (tput setab 7)
  set RESET_FORMATTING (tput sgr0)

  command mvn $argv | \
    sed -e "s/\(\[INFO\]\ -.*\)/$BOLD$TEXT_GREEN\1$RESET_FORMATTING/g" \
      -e "s/\(\[INFO\]\ [^-].*\)/$BOLD$TEXT_WHITE\1$RESET_FORMATTING/g" \
      -e "s/\(\[INFO\]\ BUILD SUCCESSFUL\)/$BOLD$TEXT_GREEN\1$RESET_FORMATTING/g" \
      -e "s/\(\[WARNING\]\)\(.*\)/$BOLD$TEXT_YELLOW\1$RESET_FORMATTING\2/g" \
      -e "s/\(\[ERROR\]\)\(.*\)/$BOLD$TEXT_RED\1$RESET_FORMATTING\2/g" \
      -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/$BOLD$TEXT_GREENTests run: \1$RESET_FORMATTING, Failures: $BOLD$TEXT_RED\2$RESET_FORMATTING, Errors: $BOLD$TEXT_RED\3$RESET_FORMATTING, Skipped: $BOLD$TEXT_YELLOW\4$RESET_FORMATTING/g"

  echo -ne $RESET_FORMATTING
end
