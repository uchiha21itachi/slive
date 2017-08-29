require "open-uri"


class SlideuploaderJob < ApplicationJob
  queue_as :critical

  def perform(presentation_id)
    
    presentation = Presentation.find(presentation_id)

    return unless presentation.present?
    pdf_file_url = presentation.pdf_file_url


    dirname = File.dirname("/tmp/presentations-#{presentation.id}/m123.pdf")
    FileUtils.mkdir_p(dirname)


    puts dirname
    file = open("#{dirname}/image-#{presentation.id}.pdf", 'wb') do |pdf|
      pdf << open(pdf_file_url).read
    end


    #filename = File.basename(file)

    #puts filename
	
		pdf = Grim.reap("#{dirname}/#{File.basename(file)}")
		count = pdf.count # count how many pages
		count.times do |index|

      file_path = "#{dirname}/image-#{presentation.id}_#{index}.png"


			if pdf[index].save(file_path)
				slide = Slide.create!(presentation: presentation, remote_photo_url: file_path)
				puts "Saved #{slide.remote_photo_url}"
			else
				puts "Couldnt save PDF with path #{file_path}"
			end
		end

  end
end
