FROM microsoft/mssql-server-linux
EXPOSE 1433
COPY octopus.mdf /var/opt/mssql/data/
COPY octopus_log.ldf /var/opt/mssql/data/
CMD [ "/opt/mssql/bin/sqlservr" ]