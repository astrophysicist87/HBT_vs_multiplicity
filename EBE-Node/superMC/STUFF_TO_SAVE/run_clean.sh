#! /usr/bin/env bash

order=$1

parallel ::: "./clean.sh $order" &>clean.out
