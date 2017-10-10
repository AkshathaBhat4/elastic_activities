require "elastic_activities/version"

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
    json_data = {
      url: request.url,
      action: params[:action],
      controller: params[:controller],
      parameters: params.except(*[:action, :controller]),
      ip_address: request.remote_ip,
      browser: request.env['HTTP_USER_AGENT'],
      datetime: DateTime.now.strftime("%Y-%m-%d %H:%M")
    }
    json_data.merge!({user_email: current_user.email}) if self.respond_to?(:current_user) && current_user.present?
    json_data
  end

end
