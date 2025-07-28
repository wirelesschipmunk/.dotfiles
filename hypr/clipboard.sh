#!/bin/bash
while true; do
	# Capture the current clipboard content
	clipboard_content=$(wl-paste)

	# Remove trailing newline using sed
	cleaned_content=$(echo "$clipboard_content" | sed ':a; /^$/{$d; N;}; /\n$/ba')

	# Place the cleaned content back into the clipboard
	echo -n "$cleaned_content" | xclip -selection clipboard
	echo -n "$cleaned_content" | wl-copy

	# Use xclip to set the clipboard content to itself (optional redundancy)
	xclip -selection clipboard -o | wl-copy

	# Wait for 0.5 seconds before next loop interation
	sleep 0.5
done
