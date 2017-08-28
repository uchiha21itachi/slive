class SlideuploaderJob < ApplicationJob
  queue_as :critical

  def perform(presentation_id)

    presentation = Presentation.find(presentation_id)
    pdf_file_url = presentation.pdf_file_url


    file     = open(pdf_file_url)
    puts pdf_file_url
    filename = File.basename(file)

    dirname = File.dirname("/tmp/presentations-#{presentation.id}/#{filename}")

    puts dirname


    FileUtils.mkdir_p(dirname)

    Docsplit.extract_images(file.path, output: dirname)

    count = Dir[File.join(dirname, '**', '*')].count { |f| File.file?(f) }
    new_count = count - 1
    (1..new_count).each do |number|
      file_path = "#{dirname}/#{filename}_#{number.to_s}.png"

      slide = Slide.create!(
        presentation: presentation, remote_photo_url: file_path)
      puts slide.inspect
    end
  end
end
