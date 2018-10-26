FROM microsoft/mssql-server-linux
EXPOSE 1433
COPY octo.bak /tmp
RUN MSSQL_SA_PASSWORD=P@ssw0rd /opt/mssql/bin/sqlservr --accept-eula & sleep 10 \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'P@ssw0rd' -Q "RESTORE DATABASE [Octopus] FROM DISK='/tmp/octo.bak' WITH MOVE 'Octopus4' TO '/var/opt/mssql/data/Octopus.mdf', MOVE 'Octopus4_Log' TO '/var/opt/mssql/data/Octopus.ldf'" \
    && pkill sqlservr
CMD [ "/opt/mssql/bin/sqlservr" ]