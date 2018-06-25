# require modules here
require "yaml"

def load_library(library)
  get_emoticon = {}
  get_meaning = {}
  get_emoticon_and_meaning= {"get_emoticon" => get_emoticon, "get_meaning" => get_meaning}
  emoticons = YAML.load_file(library)
  emoticons.each do |meaning, emoticon|
    get_emoticon[emoticon[0]] = emoticon[1]
    get_meaning[emoticon[1]] = meaning
  end
  get_emoticon_and_meaning
end


def get_japanese_emoticon(library, emoticon)
  japanese_emoticon = load_library(library)["get_emoticon"][emoticon]
  if japanese_emoticon == nil
    return "Sorry, that emoticon was not found"
  end
  japanese_emoticon
end

def get_english_meaning(library, emoticon)
  english_meaning = load_library(library)["get_meaning"][emoticon]
  if english_meaning == nil
    return "Sorry, that emoticon was not found"
  end
  english_meaning
end