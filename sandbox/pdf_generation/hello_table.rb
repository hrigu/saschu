require 'prawn'

generated_root = "generated/"

header = %w[Name Beschreibung Wo Wer]
data =
    [
        ["Kerzenziehen", "Fuer die langen Wintertage", "Im Kirchgemeindehaus", "Maria"],
        ["Kerzenziehen", "Fuer die langen Wintertage", "Im Kirchgemeindehaus", "Maria"]
    ]

pdf_data = []
pdf_data << header
pdf_data += data
data.each {|row| pdf_data << row}

# Assignment
# Explicit Block
Prawn::Document.generate("#{generated_root}table.pdf") do |pdf|
  t = pdf.make_table(pdf_data, header: true)
  t.draw
end

