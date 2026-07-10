#ROOT SENHA

source <(curl -sL 'https://raw.githubusercontent.com/kiritosshxd/socks5/refs/heads/main/root.sh')

#SOCKS5

wget -O socks5 https://github.com/kiritosshxd/socks5/raw/refs/heads/main/socks5

chmod 777 socks5

./socks5 -port 1080 -allow 1.2.3.4,5.6.7.8

./socks5 -port 1080 -allow 1.2.3.4,5.6.7.8 -user meuuser -pass minhasenha

./socks5 -port 1080 -user meuuser -pass minhasenha

#SOCKS5 INSTALL

source <(curl -sL 'https://raw.githubusercontent.com/kiritosshxd/socks5/refs/heads/main/socks5.sh')

