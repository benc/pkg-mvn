function mvn
  set -x BOLD (tput bold)
  set -x UNDERLINE_ON (tput smul)
  set -x UNDERLINE_OFF (tput rmul)
  set -x TEXT_BLACK (tput setaf 0)
  set -x TEXT_RED (tput setaf 1)
  set -x TEXT_GREEN (tput setaf 2)
  set -x TEXT_YELLOW (tput setaf 3)
  set -x TEXT_BLUE (tput setaf 4)
  set -x TEXT_MAGENTA (tput setaf 5)
  set -x TEXT_CYAN (tput setaf 6)
  set -x TEXT_WHITE (tput setaf 7)
  set -x BACKGROUND_BLACK (tput setab 0)
  set -x BACKGROUND_RED (tput setab 1)
  set -x BACKGROUND_GREEN (tput setab 2)
  set -x BACKGROUND_YELLOW (tput setab 3)
  set -x BACKGROUND_BLUE (tput setab 4)
  set -x BACKGROUND_MAGENTA (tput setab 5)
  set -x BACKGROUND_CYAN (tput setab 6)
  set -x BACKGROUND_WHITE (tput setab 7)
  set -x RESET_FORMATTING (tput sgr0)

  command mvn $argv | \
    sed -e "s/\(\[INFO\]\)\(.*\)/$TEXT_BLUE$BOLD\1$RESET_FORMATTING\2/g" \
      -e "s/\(\[INFO\]\ BUILD SUCCESSFUL\)/$BOLD$TEXT_GREEN\1$RESET_FORMATTING/g" \
      -e "s/\(\[WARNING\]\)\(.*\)/$BOLD$TEXT_YELLOW\1$RESET_FORMATTING\2/g" \
      -e "s/\(\[ERROR\]\)\(.*\)/$BOLD$TEXT_RED\1$RESET_FORMATTING\2/g" \
      -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/$BOLD$TEXT_GREENTests run: \1$RESET_FORMATTING, Failures: $BOLD$TEXT_RED\2$RESET_FORMATTING, Errors: $BOLD$TEXT_RED\3$RESET_FORMATTING, Skipped: $BOLD$TEXT_YELLOW\4$RESET_FORMATTING/g"

  echo -ne $RESET_FORMATTING
end
