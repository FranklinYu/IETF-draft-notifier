# IETF Draft Notifier

[![CircleCI](https://circleci.com/gh/FranklinYu/Atom-for-Bugzilla.svg?style=svg)](https://circleci.com/gh/FranklinYu/Atom-for-Bugzilla)
[![](https://images.microbadger.com/badges/image/franklinyu/ietf-draft-notifier.svg)](https://microbadger.com/images/franklinyu/ietf-draft-notifier "Get your own image badge on microbadger.com")
[![Docker Pulls](https://img.shields.io/docker/pulls/franklinyu/ietf-draft-notifier.svg)](https://hub.docker.com/r/franklinyu/ietf-draft-notifier)

Environment variables:
  - `JWS_KEY`: Base64-encoded key for HS256; should be 128-bit (16-byte) or more
  - `SMTP_SERVER`: SMTP server, such as `smtp.example.com`
  - `SMTP_PORT`: SMTP port number
  - `SMTP_USERNAME`: username for SMTP server
  - `SMTP_PASSWORD`: password for SMTP server
  - `SMTP_SENDER_ADDRESS`: address of sender

An easy way to generate `JWS_KEY` is

```sh
openssl rand -base64 16
```

Optional environment variable:
  - `SMTP_SENDER_NAME`: name of sender, would appear in notification. Default to
    "IETF Notification".

Resources:
  - [IETF Datatracker API](https://datatracker.ietf.org/api/)
