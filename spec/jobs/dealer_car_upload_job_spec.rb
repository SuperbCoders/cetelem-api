require 'rails_helper'

RSpec.describe DealerCarUploadJob, type: :job do
  let (:dealer) { create(:dealer) }
  before do
    CarImport.call("#{Rails.root}/spec/fixtures/cars.xml")
    YAML::load(File.open("#{Rails.root}/db/data/extra_options.yaml")).each do |type, names|
      ExtraOption.import(names.map { |name| { name: name, type: type } })
    end
  end

  it "uploads data" do
    dealer.xmls.attach(
      io: File.open("#{fixture_path}/data.xml"),
      filename: 'data.xml',
      content_type: 'application/xml'
    )

    described_class.perform_now(dealer.xmls.last, dealer)
    expect(dealer.xmls.last.status).to eq("done")
    expect(dealer.dealer_cars.count).to eq(2)
  end
end
