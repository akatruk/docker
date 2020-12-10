#! /bin/bash
apt install letsencrypt
letsencrypt certonly --webroot -w . -d bookstore.marina.katruk.ru