class Report
  attr_reader :title, :text

  def initialize(formatter)
    @title = 'Title'
    @text = ['Things are gone', 'really, really well']
    @formatter = formatter
  end

  def output_format
    @formatter.output_report(self)
  end
end

class Formatter
  def output_report(context)
    raise 'Abstract method called'
  end
end

class HTMLFormatter < Formatter
  def output_report(context)
  end
end

class PlainTextFormatter < Formatter
  def output_report(context)
  end
end
