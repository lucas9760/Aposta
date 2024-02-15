#!/data/data/com.termux/files/usr/bin/bash

# Limpa a tela ao iniciar o script
clear

# Função para exibir uma seção com cores e animação de digitação
show_section() {
    local color="$1"
    local message="$2"
    echo -e "$color"
    for ((i=0; i<${#message}; i++)); do
        echo -n "${message:$i:1}"
        sleep 0.1
    done
    echo -e "\e[0m"
    sleep 1
}

# Exibir as seções uma por uma
show_section "\e[1;34m" "Roleta premiada"
show_section "\e[1;35m" "você pode ganhar"
show_section "\e[1;36m" "Compre seu bilhete"
show_section "\e[1;33m" "Abrindo painel de aposta"

# Função para abrir o WhatsApp com a mensagem
open_whatsapp() {
    local number="5591991124440"
    local message="$1"
    termux-open "https://wa.me/$number?text=$(echo $message | sed 's/ /%20/g')"
}

# Mensagens de opções de roleta premiada
option_1_message="Oiê, eu gostaria de participar da roleta premiada 0,25"
option_2_message="Oiê, eu gostaria de participar da roleta premiada 0,50"
option_3_message="Oiê, eu gostaria de participar da roleta premiada 0,75"

# Função para exibir as regras
show_rules() {
    clear
    echo -e "\e[1;36mHá 3 opções:\n[regra]\n\n\e[1;33m*Torneio é 10 membros*\n*Quando chegar 10 membros a roleta fecha e veremos quem é o ganhador*\n\nExemplo: sala:[10] membros\nSala [cheia ]\n\nExemplo: sala:[9] membros sala [faltando 1]\e[0m"
    read -n 1 -s -r -p "Pressione qualquer tecla para voltar ao menu..."
}

# Menu de opções
while true; do
    clear
    echo -e "\e[1;31m _                          ____    ___  "
    echo -e "\e[1;32m| |   _   _  ___ __ _ ___  |___ \  / _ \ "
    echo -e "\e[1;33m| |  | | | |/ __/ _\` / __|   __) || | | |"
    echo -e "\e[1;34m| |__| |_| | (_| (_| \__ \  / __/ | |_| | "
    echo -e "\e[1;35m|_____\__,_|\___\__,_|___/ |_____(_)___/ "
    echo -e "\e[0m"
    echo -e "\e[1;34mLucas 2.0\e[0m"
    echo "Compre seu bilhete e garanta sua sorte!"

    echo -e "\e[1;32mSelecione uma opção:"
    echo -e "1. Roleta premiada 0,25$"
    echo -e "2. Roleta premiada 0,50$"
    echo -e "3. Roleta premiada 0,75$"
    echo -e "4. Regra"
    echo -e "0. \e[1;31mSair\e[0m"
    read -p "Digite o número da opção desejada: " choice

    case $choice in
        1)
            open_whatsapp "$option_1_message"
            ;;
        2)
            open_whatsapp "$option_2_message"
            ;;
        3)
            open_whatsapp "$option_3_message"
            ;;
        4)
            show_rules
            ;;
        0)
            echo -e "\e[1;31mSaindo do script."
            exit
            ;;
        *)
            echo -e "\e[1;31mOpção inválida."
            ;;
    esac
done
