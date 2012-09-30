# -*- encoding : utf-8 -*-

require "prawn"
class PdfsController < ApplicationController
  # Generates a PDF document with information on the client and
  # returns it. The user will get the PDF as a file download.
  def courses
    #client = Client.find(params[:id])
    send_data(generate_pdf,
              :filename => "Kurse.pdf",
              :type => "application/pdf")
  end

  private

  def generate_pdf()
    pdf_data = []
    pdf_data << %w[id, Name Beschreibung Wo Kapa Klassen Wer]

    Course.find_each do |course|
      pdf_data << [course.id, course.title, course.description, course.where, course.capacity, course.class_min_max, course.parent.user.name]
    end

    Prawn::Document.new(page_size: "A4", page_layout: :landscape) do |pdf|
      pdf.text "Saschu", style: :bold
      pdf.move_down(10)
      pdf.text "Alle Kurse", style: :bold, size: 24

      pdf.text "Erstellt am #{l Time.now}", align: :right

      pdf.move_down(10)

      pdf.table(pdf_data, header: true, row_colors:['FFFFFF', 'EDEDED']) do
        row(0).style(font_style: :bold, background_color: 'cccccc')
      end
    end.render

  end
end