require_relative "./fetch"

module Insert
  def self.insert_server_endpoints(master_playlist_url, base_url)
    # Make HTTP request for master manifest file
    manifest = Fetch.fetch(master_playlist_url)

    p manifest

    # Split manifest file by line so we can parse each one individually
    # Filter out any empty strings as these are not relevent
    manifest_rows = manifest.split("\n").filter { |row| !row.empty? }

    #Iterate through each manifest line so we can replace the necessary values with our new endpoints
    manifest_rows.each do |manifest_row|
    end
  end

  # TODO: Implement
  def insert_subplaylists()
  end
end
