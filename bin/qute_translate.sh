#!/bin/sh
# translate selected text into English via translate shell
case $1 in
    -g)
	printf "message-info %s" $(trans "$QUTE_SELECTED_TEXT") >> "$QUTE_FIFO"
	;;
    *)
	printf "message-info %s" $(trans -e deepl "$QUTE_SELECTED_TEXT") >> "$QUTE_FIFO"
	;;
esac
