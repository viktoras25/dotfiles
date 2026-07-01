#!/bin/sh
input=$(cat)

# Model: use display_name directly (e.g. "Sonnet 4.6")
model_name=$(echo "$input" | jq -r '.model.display_name')

# CWD with ~ shortening
cwd=$(echo "$input" | jq -r '.cwd')
home="$HOME"
short_cwd="${cwd/#$home/~}"

# Context window usage — derive used tokens from percentage × window size
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
context_window_size=$(echo "$input" | jq -r '.context_window.context_window_size // empty')

if [ -n "$used_pct" ] && [ -n "$context_window_size" ]; then
  used_pct_int=$(printf '%.0f' "$used_pct")
  used_k=$(awk "BEGIN { printf \"%.1f\", ($used_pct / 100) * $context_window_size / 1000 }")
  total_k=$(awk "BEGIN { printf \"%.0f\", $context_window_size / 1000 }")
  context_str="${used_k}k/${total_k}k (${used_pct_int}%)"
else
  context_str="0k/0k (0%)"
fi

# Subscription rate limits
five_h=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
seven_d=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
rate_str="5h: ${five_h}%, 7d: ${seven_d}%"

printf "%s | %s | %s | %s" "$model_name" "$short_cwd" "$context_str" "$rate_str"
