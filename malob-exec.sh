#!/bin/bash

# gist: reverses and runs a tac'd and rev'd script

SCRIPT=$1

rev $SCRIPT | tac | bash
