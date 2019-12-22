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

    def self.search_with_parents(query:)
      url ="https://kladr-api.ru/api.php"
      params = { query: query, contentType: :city, withParent: 1, token: "y5A2tf9ZN94NGDB6DQ2BDBTykEt4EBi9" }

      response = Typhoeus.get(url, params: params)

      JSON.parse(response.body)["result"].
        select { |i| i['type'] == 'Город' }.
        map do |i|
          {
            id: i['id'],
            name: "#{i['name']}",
            parents: i['parents'].
              reject { |r| r['type'] == 'Город' }.
              map { |p| { id: p['id'], name: p['type'] == 'Город' ? p['name'] : "#{p['name']} #{p['type']}" } } }
          end
    end

    def self.by_id(id)
      url ="https://kladr-api.ru/api.php"
      params = { cityId: id, contentType: :city, token: "y5A2tf9ZN94NGDB6DQ2BDBTykEt4EBi9" }

      response = Typhoeus.get(url, params: params)

      JSON.parse(response.body)["result"].
        find { |i| i['type'] == 'Город' }
    end
  end
end
