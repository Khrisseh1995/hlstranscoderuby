# Gems
require "sinatra"
require "dotenv"
Dotenv.load(".env")

# Service
require_relative "./service/insert"
require_relative "./constants/endpoints"

get "/generate_master_playlist" do
  master_playlist_url = params[:masterPlaylist]
  base_url = params[:baseUrl]

  Insert.insert_server_endpoints(master_playlist_url, base_url)

  # master_playlist = Fetch.fetch_manifest(master_playlist_url)

  status 200
  body "Success"
end

get "/generate_dynamic_playlist" do
  return "dynamic_playlist"
end
