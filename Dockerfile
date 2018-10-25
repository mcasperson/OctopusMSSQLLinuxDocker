FROM microsoft/mssql-server-linux
EXPOSE 1433
RUN MSSQL_SA_PASSWORD=P@ssw0rd /opt/mssql/bin/sqlservr --accept-eula & sleep 10 \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'P@ssw0rd' -Q "CREATE DATABASE Octopus" \
    && pkill sqlservr
CMD [ "/opt/mssql/bin/sqlservr" ]