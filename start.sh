#!/bin/bash

GHOST="/ghost"
GHOST_EXTERNAL="/ghost-external"

CONFIG="config.js"
DATA="content/data"
IMAGES="content/images"
THEMES="content/themes"

mkdir -p "$GHOST_EXTERNAL/$DATA"
rm -rf "$GHOST/$DATA"
ln -s "$GHOST_EXTERNAL/$DATA" "$GHOST/$DATA"

mkdir -p "$GHOST_EXTERNAL/$IMAGES"
rm -rf "$GHOST/$IMAGES"
ln -s "$GHOST_EXTERNAL/$IMAGES" "$GHOST/$IMAGES"

if [ -d "$GHOST_EXTERNAL/$THEMES" ]; then
    rm -rf "$GHOST/$THEMES"
    ln -s "$GHOST_EXTERNAL/$THEMES" "$GHOST/$THEMES" 
fi

if [ -f "$GHOST_EXTERNAL/$CONFIG" ]; then
    rm -f "$GHOST/$CONFIG"
    ln -s "$GHOST_EXTERNAL/$CONFIG" "$GHOST/$CONFIG"
fi

cd "$GHOST"

NODE_ENV=${NODE_ENV:-production} npm start