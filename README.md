BashUnit
========

A micro testing framework for bash (taken from nodejitsu)

## Example Usage:
	#!/usr/bin/env bash
	
	#
	# cli-test: Tests for forever CLI
	#
	# (C) 2012 Nodejitsu Inc.
	# MIT LICENSE
	#
	
	# Yes, we have tests in bash. How mad science is that?
	
	alias forever=bin/forever
	script="test/fixtures/log-on-interval.js"
	
    source ./bash_unit.sh
    
	echo "\033[1mRunning tests:\033[0m"
	
	# First kill all processes and remove forever directory to ensure clean 
	# environment
	forever stopall
	rm -rf ~/.forever
	
	# Spawn some process
	forever start "$script"
	
	# Assert that forever actually spawned a process and that it's in `forever list`
	sleep 1 # it takes some time until process appears in `forever list`
	forever list | grep "$script"
	spec "\`forever list\` should contain spawned process"
	
	# `forever stop` should output process it stopped...
	forever stop 0 | grep "$script"
	spec "\`forever stop 0\` should contain stopped process"
	
	# ... and actually stop it
	forever list | grep -v "$script"
	spec "\`forever stop 0\` should actually stop the process"
