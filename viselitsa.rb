# encoding: utf-8
#
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

#require 'unicode_utils/upcase'

require_relative "lib/game"
require_relative "lib/result_printer"
require_relative "lib/word_reader"

VERSION = "Игра виселица. Версия 5"

word_reader = WordReader.new
begin
    words_file_name = "#{File.dirname(__FILE__)}/data/words.txt"
  rescue Errno::ENOENT => error
  puts "\nНе найден файл с перечнем слов!\n" + error.message
end

if word_reader.read_from_args == nil
  word = word_reader.read_from_file(words_file_name)
else
  word = word_reader.read_from_args
end

game = Game.new(word)
game.version = VERSION

printer = ResultPrinter.new(game)

while game.in_progress?
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
