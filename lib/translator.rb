# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons = YAML.load_file(file_path)
  # binding.pry
  emoticons.each do |desc, array|
    hash["get_meaning"][array[1]] = desc
    hash["get_emoticon"][array[0]] = array[1]
  end
  hash
end

def get_japanese_emoticon(file_path, emoticon)
  hash = load_library(file_path)
  hash.each do |key, value_hash|
    if key == "get_emoticon"
      value_hash.each do |english, japanese|
        if english == emoticon
          return japanese
        end
      end
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  hash = load_library(file_path)
  hash.each do |key, value_hash|
    if key == "get_meaning"
      value_hash.each do |japanese, meaning|
        if japanese == emoticon
          return meaning
        end
      end
    end
  end
  "Sorry, that emoticon was not found"
end
