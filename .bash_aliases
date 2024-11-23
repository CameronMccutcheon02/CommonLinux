alias la='ls -A'
alias ll='ls -l --block-size=M'
alias lla='ls -Al'
alias lr='ls -LR'
alias cdqb='cd /home/qbittorrent'
alias cdserv='cd /home/cam/server'
alias cdtor='cd /home/qbittorrent/tor'
alias wanip4='dig @resolver4.opendns.com myip.opendns.com +short -4'

check_mullvad() {
    # Run the curl command to fetch data and capture its output
    local output
    output=$(curl -s https://am.i.mullvad.net/json)

    # Check if the output is empty
    if [ -z "$output" ]; then
        echo "No output"
        return 1
    fi

    # Split the output on commas and print each part on a new line
    echo "$output" | tr ',' '\n'
    curl https://am.i.mullvad.net/connected
}

findfile() {

    find . -iname "*$1*" -print
}

finddir() {

    find . -type d -iname "*$1*" -print
}

makeSeasonList() {
    if [ $# -ne 1 ]; then
        echo "Usage: repeat_command <number_of_times>"
        return 1
    fi
    n="$1"
    for ((i = 1; i < n+1; i++)); {
        if [ ! -d "Season$i" ]; then
            mkdir "Season$i"
        fi
    }
}
