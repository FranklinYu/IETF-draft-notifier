# frozen_string_literal: true

ssh = IetfDraft.create(name: 'ietf-curdle-ssh-ed25519', version: 2)
ssh.subscriptions.create(email: 'clark.kent@example.com')
ssh.subscriptions.create(email: 'bruce.wayne@example.com')
smime = IetfDraft.create(name: 'ietf-acme-email-smime', version: 4)
