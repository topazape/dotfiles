## dbt
if type dbt > /dev/null 2>&1; then
  mkdir -p ${XDG_CACHE_HOME}/dbt
  export DBT_LOG_PATH=${XDG_CACHE_HOME}/dbt
fi

## mysql-client
if [[ -e $(brew --prefix)/opt/mysql-client@5.7 ]]; then
  path=($(brew --prefix)/opt/mysql-client@5.7/bin $path)
  if type pspg > /dev/null 2>&1; then
    alias mysql='mysql --pager="pspg --force-uniborder --bold-labels --double-header --no-last-row-search --quit-if-one-screen -s 22"'
  fi
  alias mysqlprod="mysql -u tkawai -D csw_main -S ${HOME}/cloudsql/contents-search-windows:asia-northeast1:csw-main-sql"
  alias mysqlstg="mysql -u tkawai -D csw_main_stg1 -S ${HOME}/cloudsql/csw-stg1:asia-northeast1:csw-main-db-instance-stg11"
fi

## mycli
if type mycli > /dev/null 2>&1; then
  alias mycliprod="mycli -u tkawai -P 1 -D csw_main -S ${HOME}/cloudsql/contents-search-windows:asia-northeast1:csw-main-sql"
  alias myclistg="mycli -u tkawai -P 1 -D csw_main_stg1 -S ${HOME}/cloudsql/csw-stg1:asia-northeast1:csw-main-db-instance-stg11"
fi
