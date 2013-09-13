module TracksHelper
  def ugly_lyrics(lyrics)
    str = "<pre>"

    lyrics.split("\n").each do |line|
      str << "&#9835 "
      str << h(line)
      str << "\n"
    end

    str << "</pre>"
    str.html_safe
  end
end
