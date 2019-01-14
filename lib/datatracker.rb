# frozen_string_literal: true

require 'json'
require 'open-uri'

module Datatracker
  class NotFound < StandardError
    # @return [String] the requested name
    attr_reader :name

    # @param name [String] the requested name
    def initialize(name)
      super("the document #{name} is not found")
      @name = name
    end
  end

  # @param name [String] name of the document
  # @return [Integer] the latest version
  # @return [String] the new document that replaces +name+
  # @raise [NotFound] if the name is not found
  def self.latest_version_of(name)
    uri = "https://datatracker.ietf.org/doc/#{name}/doc.json"
    doc = JSON.parse(open(uri).read)
    case doc['state']
    when 'RFC'
      rfc = doc['aliases'][1]
      raise "unexpected alias #{rfc}" unless rfc =~ /rfc\d+/
      rfc
    when 'Replaced'
      doc['rev_history'].last['name']
    when 'Active', 'Expired'
      Integer(doc['rev'], 10)
    else
      raise "unexpected state #{doc['state']}"
    end
  rescue OpenURI::HTTPError => e
    if e.io.status[0] == '404'
      raise NotFound, name
    else
      raise
    end
  end
end
