require 'octokit'

class CoreIntegrations < ::Nanoc::DataSource
  identifier :coreint

  def up

  end

  def items
    load_items.map do |item|
      Nanoc::Item.new(item[:content],item[:attributes], item[:identifier])
    end
  end

  def update
    if ENV.has_key?('github_personal_token')
      $client = $client ||= Octokit::Client.new(:access_token => ENV['github_personal_token'])
      $client.user.login
    end
    items = []
    coreintitems = get_integration_items_from_git
    coreintitems.map do |coreintegration|
      content = %{
<h3>Overview</h3>
#{coreintegration['Overview']}

<h3>Installation</h3>
{::options parse_block_html="true" /}
<div class='ghwrap'>
#{coreintegration['Installation']}
</div>

<h3>Configuration</h3>
{::options parse_block_html="true" /}
<div class='ghwrap'>
#{coreintegration['Configuration']}
</div>

<h3>Validation</h3>
{::options parse_block_html="true" /}
<div class='ghwrap'>
#{coreintegration['Validation']}
</div>

<h3>Metrics Collected</h3>
{::options parse_block_html="true" /}
<div class='ghwrap'>
#{coreintegration['metadata']}
</div>

<h3>Troubleshooting</h3>
{::options parse_block_html="true" /}
<div class='ghwrap'>
#{coreintegration['Troubleshooting']}
</div>

<h3>Compatibility</h3>
{::options parse_block_html="true" /}
<div class='ghwrap'>
#{coreintegration['Compatibility']}
</div>
      }
      attributes = {
        title: 'Datadog-'+coreintegration['name']+' Integration',
        kind: 'coreintegration'
      }
      items << { :content => content, :attributes => attributes, :identifier => coreintegration['name']}
    end
    write_items(items)
  end

  private

  def store_filename
    'github_integration_items.yaml'
  end

  def load_items
    @items ||= File.exists?(store_filename) ? YAML.load_file(store_filename) : []
  end

  def write_items(items)
    File.open(store_filename, 'w') do |f|
      YAML.dump(items, f)
    end
  end
end
