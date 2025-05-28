#!/bin/zsh


declare -A go_array=([habits-cli]="github.com/MistbornOne/habits-cli" [gum]="github.com/charmbracelet/gum")

for key in "${!go_array[@]}"; do

done

cd ~/go/bin/

go install github.com/MistbornOne/habits-cli@latest
