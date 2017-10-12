module ElasticActivities
  class GeoLocation
    attr_accessor :as, :city, :country, :country_code, :isp, :org, :region, :region_name, :timezone, :zip, :geo_points
    attr_reader :ip_address
    def initialize(args={})
      @ip_address = args[:ip] == '127.0.0.1' ? '' : args[:ip]
    end

    def get_details
      data = `curl -XGET http://ip-api.com/json/#{ip_address}`
      json_data = JSON.parse(data)
      @as = json_data['as']
      @city = json_data['city']
      @country = json_data['country']
      @country_code = json_data['countryCode']
      @isp = json_data['isp']
      @org = json_data['org']
      @region = json_data['region']
      @region_name = json_data['regionName']
      @timezone = json_data['timezone']
      @zip = json_data['zip']
      @geo_points = {
        lat: json_data['lat'],
        lon: json_data['lon']
      }
    end
  end
end
