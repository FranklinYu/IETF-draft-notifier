# frozen_string_literal: true

class CreateDocsAndSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :ietf_drafts do |t|
      t.string :name, null: false
      t.integer :version, null: false
      t.references :successor
      t.integer :rfc
      t.timestamps
    end

    create_table :subscriptions do |t|
      t.string :email
      t.belongs_to :ietf_draft, index: true
      t.timestamps
    end
  end
end
