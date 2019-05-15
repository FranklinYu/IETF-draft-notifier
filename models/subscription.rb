# frozen_string_literal: true

require 'sinatra/activerecord'

class Subscription < ActiveRecord::Base
  belongs_to :ietf_draft
  validates :email, uniqueness: {scope: :ietf_draft_id}
end
