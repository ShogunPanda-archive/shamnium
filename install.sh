#!/usr/bin/env bash

if [[ -n "${BASH_VERSION:-}" ]] &&
  (( 65536 * ${BASH_VERSINFO[0]} + 256 * ${BASH_VERSINFO[1]} + ${BASH_VERSINFO[2]} < 197145 ))
then
  echo "BASH 3.2.25 required (you have $BASH_VERSION)"
  exit 1
fi

DESTDIR=/tmp/cowtech-sh-$(date +%Y%m%d%H%M%S)
git clone https://github.com/ShogunPanda/cowtech-sh -- $DESTDIR && cd $DESTDIR && sudo rake install && rm -rf $DESTDIR
