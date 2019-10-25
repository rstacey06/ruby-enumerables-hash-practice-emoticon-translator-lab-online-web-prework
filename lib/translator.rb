require "yaml"

def load_library(file)
  emoticons = YAML.load_file(file)
  
  hash = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }

  emoticons.each do |key,value|
    hash['get_emoticon'][value[0]] = emoticons[key][1]
    hash['get_meaning'][value[1]] = key
  end
  return hash
end

def get_japanese_emoticon(file, emoticon)
  result = library(file)['get_emoticon'][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  result = library(file)['get_meaning'][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end