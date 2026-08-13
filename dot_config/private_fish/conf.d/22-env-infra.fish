# インフラ・クラウド系ツールの環境変数

# terraform
if type -q terraform
    set -gx TF_PLUGIN_CACHE_DIR $XDG_CACHE_HOME/terraform
end

# tenv
if type -q tenv
    set -gx TENV_ROOT $XDG_DATA_HOME/tenv
end

# kubernetes
if type -q kubectl
    set -gx KUBECONFIG $XDG_CONFIG_HOME/kube/config
end

# dbt
if type -q dbt
    set -gx DBT_PROFILES_DIR $XDG_CONFIG_HOME/dbt
end

# aws-cli
if type -q aws
    set -gx AWS_SHARED_CREDENTIALS_FILE $XDG_CONFIG_HOME/aws/credentials
    set -gx AWS_CONFIG_FILE $XDG_CONFIG_HOME/aws/config
end

# docker / colima
# 対話シェル限定にしてはいけない。fish -c 'docker ...' やスクリプト、cron から
# 呼ばれたときに DOCKER_HOST が無いと colima のソケットを見つけられない。
# colima の起動処理だけは 90-interactive.fish にある。
if type -q colima; and type -q docker
    # use XDG Base Directory
    set -gx COLIMA_HOME $XDG_CONFIG_HOME/colima
    set -gx DOCKER_CONFIG $XDG_CONFIG_HOME/docker
    set -gx DOCKER_HOST "unix://$COLIMA_HOME/default/docker.sock"
end
