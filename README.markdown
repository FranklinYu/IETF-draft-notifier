# IETF Draft Notifier

Environment variables:
  - `JWS_KEY`: Base64-encoded key for HS256; should be 128-bit or more.
  - `SMTP_SERVER`: SMTP server, such as `smtp.example.com`
  - `SMTP_PORT`: SMTP port number
  - `SMTP_USERNAME`: username for SMTP server
  - `SMTP_PASSWORD`: password for SMTP server
  - `SMTP_SENDER_NAME`: name of sender, would appear in notification
  - `SMTP_SENDER_ADDRESS`: address of sender

Resources:
  - [IETF Datatracker API](https://datatracker.ietf.org/api/)
