# pkg-config
if type -q brew; and type -q pkg-config; and test -z "$PKG_CONFIG_PATH"
    set -gx PKG_CONFIG_PATH (brew --prefix)/lib/pkgconfig
end

# LLVM
if test -d (brew --prefix llvm)
    fish_add_path (brew --prefix llvm)/bin
    set -gx LDFLAGS "-L"(brew --prefix llvm)"/lib"
    set -gx CPPFLAGS "-I"(brew --prefix llvm)"/include"
end

# terraform
if type -q terraform
    set -gx TF_PLUGIN_CACHE_DIR $XDG_CACHE_HOME/terraform
end
