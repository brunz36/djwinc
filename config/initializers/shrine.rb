require "shrine"
require "shrine/storage/file_system"

require "shrine/storage/sql"
require "sequel"

DB = Sequel.connect(ActiveRecord::Base.connection_config)
Shrine.storages = {
 cache: Shrine::Storage::Sql.new(database: DB, table: :files),
 store: Shrine::Storage::Sql.new(database: DB, table: :files)
}

download_options = { prefix: "attachments", storages: [:store] }
if Rails.env.production?
  download_options.merge!(host: "https://#{ENV.fetch("APPLICATION_HOST")}")
end

Shrine.plugin :download_endpoint, download_options

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
