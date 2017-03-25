#!/usr/bin/bash
rm -f *.cache

pacman -Q \
| sed 's/ .*//' \
| sort \
> 0.cache

cat ./*/*.pkgs \
| tr -d " " \
> 1.cache

xargs -0 -n 1 pactree -lu \
< <(tr \\n \\0 <1.cache) \
> 2.cache

cat 1.cache 2.cache \
> 3.cache

cat 3.cache \
| sort \
| uniq \
> 4.cache

comm -13 4.cache 0.cache \
> 5.cache

printf "\n"

printf "Remove with:\n\$ sudo pacman -Rcn "

cat 5.cache \
| tr '\r\n' ' '

printf "\n"

rm -f *.cache
