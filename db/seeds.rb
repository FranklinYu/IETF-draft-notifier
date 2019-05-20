# frozen_string_literal: true

require 'faker'

ssh = IetfDraft.create(name: 'ietf-curdle-ssh-ed25519', version: 2)
ssh.subscriptions.create(email: Faker::Internet.email)
ssh.subscriptions.create(email: Faker::Internet.email)

smime = IetfDraft.create(name: 'ietf-acme-email-smime', version: 4)
smime.subscriptions.create(email: Faker::Internet.email)
smime.subscriptions.create(email: Faker::Internet.email)
