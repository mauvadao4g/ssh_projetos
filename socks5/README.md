#ROOT SENHA

source <(curl -sL 'https://raw.githubusercontent.com/mauvadao4g/ssh_projetos/main/socks5/root.sh')

#SOCKS5

wget -O socks5 https://github.com/mauvadao4g/ssh_projetos/raw/main/socks5/socks5

chmod 777 socks5

./socks5 -port 1080 -allow 1.2.3.4,5.6.7.8

./socks5 -port 1080 -allow 1.2.3.4,5.6.7.8 -user meuuser -pass minhasenha

./socks5 -port 1080 -user meuuser -pass minhasenha

#SOCKS5 INSTALL

source <(curl -sL 'https://raw.githubusercontent.com/mauvadao4g/ssh_projetos/main/socks5/socks5.sh')

