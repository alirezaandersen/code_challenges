class Movie
  attr_reader :runtime, :title

  def initialize(text)
    parsed = parse(text)

    @runtime = parsed[:runtime]
    @title = parsed[:title]
  end

  def parse(text)
    parts = text.split('|')
    { runtime: parts[1].to_i, title: parts[0] }
  end
end
