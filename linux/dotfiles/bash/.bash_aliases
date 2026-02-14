alias gksudo="pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY"
alias fzp="fzf --preview 'cat {}'"
alias grep="grep --color=auto --exclude-dir=node_modules --exclude-dir=vendor"
alias dev-node='_devnode(){ docker run --name node-lts-alpine -it --rm -v "$PWD":/app -w /app --user "$(id -u):$(id -g)" "$@" --entrypoint sh node:lts-alpine; }; _devnode'
alias recaudio='ffmpeg -f pulse -i default -f pulse -i @DEFAULT_SINK@.monitor -filter_complex "amix=inputs=2:duration=longest" -acodec pcm_s16le "$(date +%Y-%m-%d\ %H-%M-%S)-audio-recording.wav"'
