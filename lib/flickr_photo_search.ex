defmodule FlickrPhotoSearch do
  import Input

  def run do
    HTTPoison.start
    text = get_string_input("Search text: ")

    HTTPoison.get!(request_url(text)).body
    |> Poison.decode!
  end

  def request_url(text) do
    api_url <> "?api_key=#{api_key}&method=flickr.photos.search&text=#{text}&format=json&per_page=10&nojsoncallback=1"
  end

  def api_url do
    "https://api.flickr.com/services/rest/"
  end

  def api_key do
    System.get_env("FLICKR_API_KEY")
  end
end
