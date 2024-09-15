#!/usr/bin/env bash
sleep 20
./opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P dvpTasks1234. -i setup.sql -C
