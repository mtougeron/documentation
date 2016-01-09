require 'octokit'

class CoreIntegrations < ::Nanoc::DataSource
  identifier :coreint

  def up
    if ENV.has_key?('github_personal_token')
      $client = $client ||= Octokit::Client.new(:access_token => ENV['github_personal_token'])
      $client.user.login
    end
  end


  def items
    coreintitems = get_integration_items_from_git

    coreintitems.map do |coreintegration|
      item = %{
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
      attributes = {title: 'Datadog-'+coreintegration['name']+' Integration', kind: 'coreintegration'}
      coreintegration['kind']='coreintegration'
      Nanoc::Item.new(item,attributes, coreintegration['name'])
    end
  end
end
