#!/bin/bash

sed -r 's/([[:digit:]]{1,3}\.)([[:digit:]]{1,3}\.)([[:digit:]]{1,3}\.)([[:digit:]]{1,3})/\4\.\3\2\1/' access.log > anon.log
