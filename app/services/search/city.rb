# frozen_string_literal: true

module Search
  module City
    def self.call(query:, region_id:)
      url ="https://kladr-api.ru/api.php"
      params = { query: query, contentType: :city, regionId: region_id, token: "y5A2tf9ZN94NGDB6DQ2BDBTykEt4EBi9" }

      response = Typhoeus.get(url, params: params)

      JSON.parse(response.body)["result"].
        select { |i| i['type'] == 'Город' }.
        map { |i| { id: i['id'], name: "#{i['name']}" } }
    end
  end
end
