require "elastic_activities/version"
require "elastic_activities/geo_location"
require "user_agent"

module ElasticActivities
  # Your code goes here...
  mattr_accessor :index_name, :elastic_url

  def self.setup
    yield self
  end

  def add_logs
    `curl -XPOST http://#{self.elastic_url}/#{self.index_name}/logs -d '#{log_json.to_json}'`
  end

  private

  def log_json
    geo_location = GeoLocation.new(ip: request.remote_ip)
    geo_location.get_details
    user_agent = UserAgent.parse(request.env['HTTP_USER_AGENT'])
    json_data = {
      url: request.url,
      action: params[:action],
      controller: params[:controller],
      parameters: params.except(*[:action, :controller]),
      ip_address: request.remote_ip,
      browser: user_agent.browser,
      browser_version: user_agent.version.to_s,
      platform: user_agent.platform,
      os: user_agent.os,
      datetime: DateTime.now.strftime("%Y-%m-%d %H:%M"),
      as: geo_location.as,
      city: geo_location.city,
      country: geo_location.country,
      country_code: geo_location.country_code,
      isp: geo_location.isp,
      org: geo_location.org,
      region: geo_location.region,
      region_name: geo_location.region_name,
      timezone: geo_location.timezone,
      zip: geo_location.zip,
      geo_points: geo_location.geo_points
    }
    json_data.merge!({user_email: current_user.email}) if self.respond_to?(:current_user) && current_user.present?
    json_data
  end

end
