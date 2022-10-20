FROM alpine
ARG DOPPLER_TOKEN
RUN apk add --no-cache curl gnupg
RUN (curl -Ls --tlsv1.2 --proto "=https" --retry 3 https://cli.doppler.com/install.sh || wget -t 3 -qO- https://cli.doppler.com/install.sh) | sh
CMD ["doppler", "run", "--", "printenv"]
