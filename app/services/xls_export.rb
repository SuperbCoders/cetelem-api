# frozen_string_literal: true

module XlsExport
  PATH = 'tmp'

  def self.call(data, name: "car")
    data = Array.wrap(data)
    xls = Spreadsheet::Workbook.new

    sheet1 = xls.create_worksheet
    sheet1.name = name
    sheet1.row(0).concat data.first.keys.map(&:to_s) unless data.empty?

    data.each_with_index do |item, index|
      sheet1.row(index + 1).concat item.values.map(&:to_s)
    end

    path = "#{PATH}/#{name}_#{Time.now.to_i}.xlsx"
    xls.write("#{PATH}/#{name}_#{Time.now.to_i}.xlsx")

    path
  end
end
