class ExportPdf
  include Prawn::View

  def initialize
    content
  end

  def content
    text "Hello World!"
  end
end