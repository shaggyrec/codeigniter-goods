#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

mysql -u root < ${DIR}/fixture.sql
#2> /dev/null
