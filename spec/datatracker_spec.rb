# frozen_string_literal: true

require_relative '../lib/datatracker'

describe Datatracker do
  describe '::get_latest_version' do
    context 'when the draft is active' do
      it 'gives current version number' do
        expect(subject.latest_version_of('draft-ietf-httpbis-security-properties')).to eq(5)
      end
    end

    context 'if the draft is replaced' do
      it 'gives the new name' do
        expect(subject.latest_version_of('draft-ietf-tls-tls13')).to eq('rfc8446')
        expect(subject.latest_version_of('draft-fairhurst-tsvwg-circuit-breaker'))
          .to eq('draft-ietf-tsvwg-circuit-breaker')
      end
    end

    context 'if the draft is not found' do
      it 'raises error' do
        expect { subject.latest_version_of('draft-foobar') }.to raise_error(Datatracker::NotFound)
      end
    end
  end
end
