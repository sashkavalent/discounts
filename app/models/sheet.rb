# == Schema Information
#
# Table name: sheets
#
#  id         :integer          not null, primary key
#  chain_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_sheets_on_chain_id  (chain_id)
#

class Sheet < ActiveRecord::Base
  belongs_to :chain
  delegate :sheet_setting, to: :chain
  has_many :images, as: :imageable, class_name: Image
  has_many :discounts, dependent: :destroy

  def source_url=(url)
    self.attachment = URI.parse(url).to_s
  end
  def source_url;end

  # def self.selector
  #   "a:contains('Скачать буклет в формате PDF')"
  # end

  # def self.page_url
  #   'http://sosedi.by/akcii/osobaya_cena.php'
  # end

  # def self.get_pdf_url
  #   # doc = Nokogiri::HTML(open(page_url).read)
  #   # doc.css(selector).first.attributes['href'].value
  #   'http://sosedi.by//upload/iblock/c5b/c5b25b49a7eb5cb2e084702abb72dca1.pdf'
  # end

  # def self.create_via_grim(density)
  #   pdf.each do |page|
  #     path = @pdf.path + (index = (index || 0) + 1).to_s + density.to_s + '.jpg'
  #     page.save(path, density: density)
  #     Image.create!(attachment: File.open(path))
  #   end
  # end

  # def self.create_images
  #   MiniMagick::Tool::Convert.new do |converter|
  #     converter.density 200
  #     converter << 'c5b25b49a7eb5cb2e084702abb72dca1.pdf'
  #     converter << 'foo-%02d.jpg'
  #   end
  #   # path_to_pdf = Sheet.first.attachment.path
  #   image_from_pdf = MiniMagick::Image.open(get_pdf_url)
  #   image_from_pdf.format 'png', nil
  #   image_from_pdf.pages.each_with_index do |page, index|
  #     file_path = "/tmp/#{page.path}#{index}"
  #     page.write(file_path)
  #     Image.create!(attachment: File.open(file_path))
  #   end
  # end

  def split_into_discounts
    image_pathes = images.map(&:attachment).map(&:path)
    magick_images = image_pathes.map { |path| MiniMagick::Image.open(path) }

    magick_images.each do |magick_image|
      tmp_image_path = crop_image(magick_image)
      tile_image(tmp_image_path)

      tiles_count = sheet_setting.rows_number * sheet_setting.columns_number
      tiles_count.times do |index|
        file = File.open(tiled_image_path(tmp_image_path, index))
        discounts.create(chain_id: chain_id, image_attributes: { attachment: file })
        # File.delete(tmp_image_path)
      end
      # tile_width = magick_image.height / sheet_setting.rows_number
      # tile_height = magick_image.width / sheet_setting.columns_number
      #
      # sheet_setting.columns_number.times do |column_number|
      #   sheet_setting.rows_number.times do |row_number|
      #     start_column = column_number * tile_width
      #     start_row = row_number * tile_height

      #     cropped = magick_image.crop(start_column, start_row, tile_width, tile_height)
      #     cropped.write("#{index}_#{column}x#{row}.jpg")
      #   end
      # end
    end
  end

  def tile_image(image_path)
    MiniMagick::Tool::Convert.new do |converter|
      converter << image_path
      converter.crop "#{sheet_setting.columns_number}x#{sheet_setting.rows_number}@"
      converter << tiled_image_path(image_path, '%d')
    end
  end

  def tiled_image_path(image_path, number)
    "#{image_path}#{number}.jpg"
  end

  def crop_image(magick_image)
    right = sheet_setting.margin_right * magick_image.width / 100
    left = sheet_setting.margin_left * magick_image.width / 100
    top = sheet_setting.margin_top * magick_image.height / 100
    bottom = sheet_setting.margin_bottom * magick_image.height / 100

    result_path = magick_image.path + '.jpg'
    MiniMagick::Tool::Convert.new do |converter|
      converter << magick_image.path
      converter.crop "0x0-#{right}-#{bottom}"
      converter.crop "0x0+#{left}+#{top}"
      converter << result_path
    end
    result_path
  end
end
