require 'io/console'

def extract_title(*args)
  block_title = args[0]
  ancor_start = block_title.index('<a ')
  unless ancor_start.nil?
    ancor_end = block_title.index('>')
    block_title = block_title[ancor_end + 1..-1]
    closing = block_title.index('</a>')
    block_title = block_title[0..closing - 1]
  end
  block_title
end

def extract_href(ancor)
  href_start = ancor.index('href')
  ancor = ancor[href_start + 1..-1]
  href_quot = ancor.index('\"')
  ancor = ancor[href_quot + 1..-1]
  href_end = ancor.index('\"')
  ancor = ancor[0..href_end - 1]
  ancor
end

def screen_width
  screen_size = IO.console.winsize
  screen_size[1]
end

def header_lines(text, padding)
  r_text = text
  lines = []
  until r_text.nil?
    line_size = lines.count.zero? ? screen_width - (padding * 2) : screen_width - (padding * 2) - 4
    str_index = line_size - 1
    str_index = shift_index(r_text, str_index) if r_text.index(' ') && (r_text.size > str_index)
    line = r_text[0..str_index]
    lines << (lines.count.zero? ? line : (String.new(' ' * 4) + line))
    r_text = r_text[(str_index + 1)..-1]
  end
  lines
end

def text_lines(text, padding)
  line_size = screen_width - (padding * 2)
  r_text = text
  lines = []
  until r_text.nil?
    str_index = line_size - 1
    str_index = shift_index(r_text, str_index) if r_text.index(' ') && (r_text.size > str_index)
    line = r_text[0..str_index]
    lines << line
    r_text = r_text[(str_index + 1)..-1]
  end
  lines
end

def shift_index(r_text, str_index)
  str_index -= 1 while r_text[str_index] != ' '
  str_index
end

def horz_line(padding)
  line_size = screen_width - (padding * 2)
  String.new('-' * line_size)
end

def double_horz_line(padding)
  line_size = screen_width - (padding * 2)
  String.new('=' * line_size)
end

def top_line(text, padding)
  line_size = screen_width - (padding * 2) - text.size
  String.new('_' * (line_size / 2)) + text + String.new('_' * (line_size / 2))
end
