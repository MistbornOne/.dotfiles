#!/bin/zsh

docker run -it --rm \
  --env-file ~/dev/github/MistbornOne/projects/agents/codetutorai/.env \
  -v "$HOME/Documents/Obsidian/code-tutor":/logs \
  codetutor "$@"
