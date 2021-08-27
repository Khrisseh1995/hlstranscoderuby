require "minitest/autorun"
require "../src/service/util"

class UtilTest < Minitest::Test
  # As we have different "rows" in HLS manifests, this tests retrieving a single value from one of those rows
  def test_hls_video_row_retrieval
    test_manifest_row = %(#EXT-X-STREAM-INF:BANDWIDTH=628000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,AUDIO="audio")

    result = Util.fetch_manifest_value(test_manifest_row, "BANDWIDTH=")
    assert result == "628000"
  end

  def test_hls_audio_row_retrieval
    test_manifest_row = %(#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="audio",NAME="English stereo",LANGUAGE="en",AUTOSELECT=YES,URI="https://somehlsendpoint.com/testendpoint")
    result = Util.fetch_manifest_value(test_manifest_row, "URI=")

    assert result == "https://somehlsendpoint.com/testendpoint"
  end
end
