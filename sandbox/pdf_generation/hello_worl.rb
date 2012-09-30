require 'prawn'

generated_root = "generated/"
# Assignment
pdf = Prawn::Document.new
pdf.text "Hello World"
pdf.render_file "#{generated_root}assignment.pdf"
# Implicit Block
Prawn::Document.generate("#{generated_root}implicit.pdf") do
  text "Hello World"
end
# Explicit Block
Prawn::Document.generate("#{generated_root}explicit.pdf") do |pdf|
  pdf.text "Hello World"
end