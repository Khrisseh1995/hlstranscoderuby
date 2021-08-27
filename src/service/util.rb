module Util
  # TODO: This will fail if there are "," elsewhere, but only CODECS should contain this. May need
  #       to change if CODEC needs plucked from the row
  def self.fetch_manifest_value(manifest_slice, match_value)
    # Split URI values into array ["#EXT-X-STREAM-INF:BANDWIDTH=628000", "CODECS=\"avc1.42c00d"] etc
    split_chunks = manifest_slice.split(",")
    # Fetch value corresponding to match_value from array
    matching_stream_data = split_chunks.find { |chunk| chunk.include? match_value }
    # Value will be represented as KEY=VALUE in manifest, so split on '=' and return the value
    _, manifest_value = matching_stream_data.split("=")

    # Remove any escape characters that may be in manifest string
    return manifest_value.delete('\\"')
  end
end
