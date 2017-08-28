require "open-uri"


class SlideuploaderJob < ApplicationJob
  queue_as :critical

  def perform(presentation_id)

    presentation = Presentation.find(presentation_id)

    return unless presentation.present?
    pdf_file_url = presentation.pdf_file_url

    file = nil

    dirname = File.dirname("/tmp/presentations-#{presentation.id}/m123.pdf")
    FileUtils.mkdir_p(dirname)


    puts dirname
    file = open("#{dirname}/pdf-file-#{presentation.id}.pdf", 'wb') do |pdf|
      pdf << open(pdf_file_url).read
    end


    #filename = File.basename(file)

    #puts filename

    Docsplit.extract_images(file.path, output: dirname)

    count = Dir[File.join(dirname, '**', '*')].count { |f| File.file?(f) }
    new_count = count - 1
    (1..new_count).each do |number|
      file_path = "#{dirname}/pdf-file-#{presentation.id}_#{number.to_s}.png"

      slide = Slide.create!(
        presentation: presentation, remote_photo_url: file_path)
    end
  end
end
