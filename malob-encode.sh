#!/bin/bash

# script to "encode" text passed to it

tac $1 | rev > script.encoded 
