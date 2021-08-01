#!/bin/bash

sed -n '{7,16=;7,16p}' list.txt | sed '{N;s/\n/ /}'
