require "pry"
require "yaml"

def load_library(file)
  library = { "get_emoticon" => {}, "get_meaning" => {} }
  YAML.load_file(file).each do |word, emoji|
    engl, japn = emoji
      library["get_meaning"][japn] = word
      library["get_emoticon"][engl] = japn

  end
 library
end

def get_japanese_emoticon(file, emoji)
    translation_hash = load_library(file)
    trans = translation_hash["get_emoticon"][emoji]
    if trans == nil
      "Sorry, that emoticon was not found"
    else
      trans
    end
end

def get_english_meaning (file, emoji)
  # binding.pry
  translation_hash = load_library(file)
  trans = translation_hash["get_meaning"][emoji]
  if trans == nil
    "Sorry, that emoticon was not found"
  else
    trans
  end
end
