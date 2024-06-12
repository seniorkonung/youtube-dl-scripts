FROM ubuntu:latest

RUN apt update && apt -y install curl python3.12-minimal ffmpeg && ln /usr/bin/python3.12 /usr/bin/python
RUN curl -L https://github.com/ytdl-org/ytdl-nightly/releases/download/2024.05.31/youtube-dl -o /usr/local/bin/youtube-dl && chmod a+rx /usr/local/bin/youtube-dl
RUN youtube-dl -U

CMD ["youtube-dl"]
