# frozen_string_literal: true

module Search
  module Region
    def self.call(query:)
      url ="https://kladr-api.ru/api.php"
      params = { query: query, contentType: :region, token: "y5A2tf9ZN94NGDB6DQ2BDBTykEt4EBi9" }

      response = Typhoeus.get(url, params: params)

      JSON.parse(response.body)["result"].
        reject { |i| i['id'] == 'Free' }.
        map { |i| { id: i['id'], name: i['type'] == 'Город' ?  i['name'] : "#{i['name']} #{i['type']}" } }
    end
  end
end
