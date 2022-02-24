#!/bin/bash

function error_exit {
  echo "$1" >&2
  exit 1
}


#--- MAIN

bintools=$HOME/bin/tools
pushd $bintools
if [[ "$?" = 1 ]]; then
    echo "Criando '$bintools'..."

    mkdir -p $bintools \
        error_exit "Não criei diretório. Saindo..."

    pushd $bintools || \
        error_exit "Não mudei de diretório. Saindo..."

fi
cloned=0
if [[ -d ansible ]]; then
    echo "Encontrei um repositório ansible..."
    cd ansible

    git pull --rebase \
    && echo "git pull. OK" \
    && git submodule update --init --recursive \
    && echo "Submódulos atualizados. OK" \
    && cloned=1 \
    || error_exit "Alarme falso. Renomei ou remova: $bintools/ansible"
    cd ..
fi

if [[ "$cloned" == 0 ]]; then
    echo "Clonando ansible.."
    git clone https://github.com/ansible/ansible.git --recursive || \
        error_exit "Clonagem falhou. :("
fi

source ansible/hacking/env-setup -q

ansible --version | grep ansible.[0-9]


# back to where it starts
popd

