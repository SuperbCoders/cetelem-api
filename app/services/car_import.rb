# frozen_string_literal: true

module CarImport
  def self.call(path = "#{Rails.root}/spec/fixtures/cars.xml")
    Nokogiri::XML(File.read(path)).xpath('//mark').each do |mark_node|
      mark = Mark.find_or_create_by!(name: mark_node.attributes['name'].value)

      mark_node.xpath('folder').each do |folder|
        model = mark.models.create(name: folder.attributes['name'].value)

        folder.xpath('modification').each do |modification_node|
          modification = model.find_or_create_by(name: modification_node.attributes['name'].value,
                                                 body_type: modification_node.xpath('body_type').text,
                                                 year: modification_node.xpath('years').text)

          modification_node.xpath('complectation').each do |_complectation_node|
            modification.create(complectation_node.text)
          end
        end
      end
    end
  end
end
