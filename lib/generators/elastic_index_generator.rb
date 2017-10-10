class ElasticIndexGenerator < Rails::Generators::Base
  def create_initializer_file
    puts "Enter elastic index name"
    index_name = gets.gsub("\n", '')
    puts "Enter elastic url"
    elastic_url = gets.gsub("\n", '')

    dir_name = File.dirname(__FILE__)
    `curl -XPUT http://#{elastic_url}/#{index_name} -d @#{dir_name}/elastic_index.json`

    create_file "config/initializers/elastic_activities.rb", <<-FILE
ElasticActivities.setup do |config|
  config.index_name = '#{index_name}'
  config.elastic_url = '#{elastic_url}'
end
    FILE

    inject_into_file "config/environment.rb", "include ElasticActivities\n", before: "# Initialize the Rails application."
  end
end
