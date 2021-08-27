require_relative "./util"
require_relative "../constants/endpoints"

module Replace
  # Use this later
  def fetch_endpoints
    return [
             EndpointConstants::LOCAL_BASE_URL,
             EndpointConstants::DYNAMIC_PLAYLIST_ENDPOINT,
           ]
  end

  def replace_audio_endpoints(manifest_slice, base_url)
    # Pluck original value for audio so we can replace it with our new endpoint
    original_uri_value = Util.fetch_manifest_value(manifest_slice, "URI=")

    # Place predefined endpoint constants into local variabels
    local_base_url, dynamic_playlist_endpoint = fetch_endpoints

    # The replacement value for the URI tag that will be called for the respective video manifest
    audio_tag_endpoint = "#{baseurl}/#{dynamic_playlist_endpoint}?subPlaylistUrl=#{base_url}&format=audio"

    # Return replaced URI value to be that of our new endpoint
    return manifest_slice.gsub(original_uri_value, audio_tag_endpoint)
  end

  def replace_video_endpoints(manifest_slice, base_url)
    # Place predefined endpoint constants into local variabels
    local_base_url, dynamic_playlist_endpoint = fetch_endpoints

    # The replacement value for the URI tag that will be called for the respective video manifest
    video_tag_endpoint = "#{baseurl}/#{dynamic_playlist_endpoint}?subPlaylistUrl=#{base_url}&format=audio"
  end

  def self.replace_endpoint(manifest_slice)
    # If slice is an video row return video replacement logic
    if manifest_slice.include? "#EXT-X-STREAM-INF"
      return replace_video_endpoints
    end
    # If slice is an audio row return audio replacement logic
    if manifest_slice.include? "EXT-X-MEDIA:TYPE=AUDIO"
      return replace_audio_endpoints
    end
    # If it is neither no replacement needs to be done
    return nil
  end
end
