require "open-uri"


class SlideuploaderJob < ApplicationJob
  queue_as :critical

  def perform(presentation_id)

    presentation = Presentation.find(presentation_id)
    pdf_file_url = presentation.pdf_file_url

    file = nil

    dirname = File.dirname("/tmp/presentations-#{presentation.id}/m123.pdf")
    FileUtils.mkdir_p(dirname)


    puts dirname
    if Rails.env.production?
      open("#{dirname}/pdf-file-#{presentation.id}.pdf", 'wb') do |file|
        file << open(pdf_file_url).read
      end
    else
      file = open(pdf_file_url)
    end


    filename = File.basename(file)

    Docsplit.extract_images(file.path, output: dirname)

    count = Dir[File.join(dirname, '**', '*')].count { |f| File.file?(f) }
    new_count = count - 1
    (1..new_count).each do |number|
      file_path = "#{dirname}/#{filename}_#{number.to_s}.png"

      slide = Slide.create!(
        presentation: presentation, remote_photo_url: file_path)
    end
  end
end
