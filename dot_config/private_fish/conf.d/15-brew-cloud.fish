# tenv
if test -d (brew --prefix tenv)
    set -gx TENV_ROOT $XDG_DATA_HOME/tenv
end

# aws-cli
if type -q aws
    set -gx AWS_SHARED_CREDENTIALS_FILE $XDG_CONFIG_HOME/aws/credentials
    set -gx AWS_CONFIG_FILE $XDG_CONFIG_HOME/aws/config
end

# # google-cloud-sdk
# if test -d (brew --prefix)/share/google-cloud-sdk
#     source (brew --prefix)/share/google-cloud-sdk/path.fish.inc
#     # Google Cloud SDK fish completions should be in (brew --prefix)/share/google-cloud-sdk/completions/
# end
