# encoding: utf-8
#
class WordReader
  def read_from_args
    ARGV[0]
  end

  def read_from_file(file_name)
    return nil if !File.exist?(file_name)

    file = File.new(file_name, "r:UTF-8")
    lines = file.readlines
    file.close

    lines.sample.chomp
  end
end
