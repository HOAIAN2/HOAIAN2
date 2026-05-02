alias gksudo="pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY"
alias fzp="fzf --preview 'batcat --color=always --theme=base16 {}'"
alias grep="grep --color=auto --exclude-dir=node_modules --exclude-dir=vendor"
alias recaudio='ffmpeg -f pulse -i default -f pulse -i @DEFAULT_SINK@.monitor -filter_complex "amix=inputs=2:duration=longest" -acodec pcm_s16le "$(date +%Y-%m-%d\ %H-%M-%S)-audio-recording.wav"'
alias chrome-curl='docker run --rm -u $(id -u):$(id -g) -v $(pwd):/data -w /data lexiforest/curl-impersonate:alpine curl_chrome123'
