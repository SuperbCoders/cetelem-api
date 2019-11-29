# frozen_string_literal: true

module CarImport
  def self.call(path = "#{Rails.root}/spec/fixtures/cars.xml")
    puts '###### STARTS Uploading All Cars'

    Nokogiri::XML(File.read(path)).xpath('//mark').each do |mark_node|
      mark = Mark.find_or_create_by!(name: mark_node.attributes['name'].value)

      mark_node.xpath('folder').each do |folder|
        model = mark.models.find_or_create_by!(name: folder.attributes['name'].value)

        folder.xpath('modification').each do |modification_node|
          model.modifications.find_or_create_by!(name: modification_node.attributes['name'].value,
                                                                body_type: modification_node.xpath('body_type').text,
                                                                years: modification_node.xpath('years').text)

          modification_node.xpath('complectations//complectation').each do |complectation_node|
            model.complectations.find_or_create_by!(name: complectation_node.text)
          end
        end

        modification_ids = model.modifications.pluck(:id).map { |id| { modification_id: id } }
        complectation_ids = model.complectations.pluck(:id).map { |id| { complectation_id: id } }
        cars_data =
          modification_ids.product(complectation_ids.presence || [{}]).flat_map do |item|
            item.inject({model_id: model.id, mark_id: mark.id}, :merge)
          end

        cars_data.each do |item|
          Car.find_or_create_by!(item)
        end
      end
    end

    puts '###### FINISHED Uploading All Cars'
  end
end
