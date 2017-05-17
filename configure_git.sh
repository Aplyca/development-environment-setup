#!/usr/bin/env bash
echo "Enter the following to configure Git with SSH key pair"
echo "Your name:"
read name;
echo "Your email:"
read email;
echo "Git remote host:"
read host;
echo "Local key name:"
read key;

if [ -z "${name}" ] || [ -z "${email}" ]; then
  echo "Git config not setted, keeping the current.";
else
  git config --global user.name "$name";
  git config --global user.email "$email";
fi

if [ -z "${host}" ] || [ -z "${key}" ]; then
  echo "SSH key not setted";
else
  ssh-keygen -t rsa -b 4096 -C "$email" -f ~/.ssh/$key -N '';
  printf "\nHost $host\n    HostName $host\n    User git\n    IdentityFile ~/.ssh/$key\n    StrictHostKeyChecking no\n" >> ~/.ssh/config;
  pbcopy < ~/.ssh/$key.pub;
  echo "You public key (~/.ssh/$key.pub) was copied to your clipboard";
fi