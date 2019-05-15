# frozen_string_literal: true

require 'sinatra/activerecord'

class IetfDraft < ActiveRecord::Base
  has_many :subscriptions
  belongs_to :successor, class_name: IetfDraft.name
end
