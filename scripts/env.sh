#!/bin/bash
# This script creates and activates a Python virtual environment for the project.
if [ ! -d "venv" ]; then
  python3 -m venv venv
fi
source venv/bin/activate
