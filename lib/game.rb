# encoding: utf-8
class Game
  attr_reader :errors, :letters, :good_letters, :bad_letters, :status
  attr_accessor :version

  MAX_ERRORS = 7

  def initialize(slovo)
    @letters = get_letters(slovo)
    @errors = 0
    @good_letters = []
    @bad_letters = []

    @status = :in_progress # :won, :lost
  end
#-------------------------------------------------------------------------
  def get_letters(slovo)
    if slovo.nil? || slovo == ""
      abort "No word. Exit program"
    else
      slovo = slovo.encode("UTF-8")
    end

    slovo.encode('UTF-8').split("")
  end
#-------------------------------------------------------------------------
  def max_errors
    MAX_ERRORS
  end
#-------------------------------------------------------------------------
  def errors_left
    MAX_ERRORS - @errors
  end
#-------------------------------------------------------------------------
  def is_good?(letter)
    @letters.include?(letter) ||
      (letter == "е" && @letters.include?("ё")) ||
      (letter == "ё" && @letters.include?("е")) ||
      (letter == "и" && @letters.include?("й")) ||
      (letter == "й" && @letters.include?("и"))
  end
#-------------------------------------------------------------------------
  def add_letter_to(letters, letter)
      letters << letter

      case letter
      when "и" then letters << "й"
      when "й" then letters << "и"
      when "е" then letters << "ё"
      when "ё" then letters << "е"
      end
  end
#-------------------------------------------------------------------------
  def solved?
    (@letters - @good_letters).empty?
  end
#-------------------------------------------------------------------------
  def repeated?(letter)
    @good_letters.include?(letter) || @bad_letters.include?(letter)
  end
#-------------------------------------------------------------------------
  def lost?
    @status == :lost || @errors >= MAX_ERRORS
  end
#-------------------------------------------------------------------------
  def in_progress?
    @status == :in_progress
  end
#-------------------------------------------------------------------------
  def won?
    @status == :won
  end
#-------------------------------------------------------------------------
  def next_step(letter)
    return if @status == :lost || @status == :won
    return if repeated?(letter)

    if is_good?(letter)
      add_letter_to(@good_letters, letter)

      @status = :won if solved?
    else
      add_letter_to(@bad_letters, letter)

      @errors += 1

      @status = :lost if lost?
    end
  end
#------------------------------------------------------------------------
  def ask_next_letter
    puts "\nВведите следующую букву"
    letter = ""

    letter = STDIN.gets.encode("UTF-8").downcase.chomp while letter == ""

    next_step(letter)
  end
end
