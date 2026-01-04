# miseでphpをインストールする場合、あった方がいい
# https://zenn.dev/aun_phonogram/articles/80b68ce6ae61d8
export PHP_CONFIGURE_OPTIONS="--with-openssl=$(brew --prefix openssl) --with-iconv=$(brew --prefix libiconv)"
