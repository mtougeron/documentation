require 'octokit'
require 'base64'
require 'csv'
require 'json'

require './lib/default.rb'

def get_integration_items_from_git
  # ghintegrations = @items.select{ |item| item[:kind] == 'coreintegration'}
  # puts ghintegrations.inspect
  start = Time.now
  output = []
  if ENV.has_key?('github_personal_token')
    git_repos = [
      {
        "name"=>"datadog/core-integrations",
        "dir"=> "/"
        }
      ]

    git_repos.each do |repo|
      startrepo = Time.now
      metadata = ''
      integrationlist = $client.contents(repo['name'], :path => "/")
      integrationlist.each do |integration|
        startintegration = Time.now
        if integration.type == 'dir'
          parsedintegration = {
            'path'=>integration['path']
          }
          integrationfiles = $client.contents(repo['name'], :path => integration['path'])
          integrationfiles.each do |ifile|

            if ifile.type == 'file'
              if ifile.name == integration['name']+'_metadata.csv'
                metadata = $client.contents(repo['name'], :path => ifile['path']).content
                parsedintegration['metadata'] = parse_metrics(metadata)
              elsif ifile.name == 'manifest.json'
                manifest = JSON.parse(Base64.decode64($client.contents(repo['name'], :path => ifile['path']).content), :quirks_mode=>true)
                parsedintegration['name']=manifest['name']
                parsedintegration['displayname']=manifest['display_name']
                parsedintegration['shortdescription']=manifest['short_description']
                parsedintegration['description']=manifest['description']
              elsif ifile.name == 'README.md'
                readmearray = parse_readme_from_git(repo['name'],ifile['path'])
                %w{Overview Installation Configuration Validation Troubleshooting Compatibility}.each do |vs|
                  parsedintegration[vs] = readmearray[vs] || 'N/A'
                end
              end
            end
          end
          if parsedintegration['name'] != 'official'
            output.push(parsedintegration)
          end
        end
        puts "Processed Integration #{integration['path']}: #{(Time.now - startintegration)*1000} ms"
      end
      puts "Processed Repo #{repo['name']}: #{(Time.now - startrepo)*1000} ms"
    end
  end
  print_profile("*****Get All Integrations", start)
  return output
end

def parse_readme_from_git(repo, path)
  start = Time.now
  validsections = %w{Overview Installation Configuration Validation Troubleshooting Compatibility}
  harray={}
  readmefile = Base64.decode64($client.contents(repo, :path => path).content)
  headings = []
  sections = readmefile.split(/^# ?\w.* *$/)
  readmefile.scan(/^(?:# ?)(\w.*)$/) do |h|
    headings << h[0]
  end

  if headings.count+1==sections.count
    validsections.each do |vs|
      unless headings.index(vs).nil?
        harray[vs]= sections[headings.index(vs)+1]
      end
    end
  end
  print_profile("Parsed readme for #{path}", start)
  return harray
end

def parse_metrics(rawcsv)
  metric_string = "<table class='table'>"
  CSV.parse(Base64.decode64(rawcsv), :headers => true) do |row|
    # row.each do |metric_name, metric_type, interval, unit_name, per_unit_name, description, orientation, integration, short_name |
      metric_string += "<tr><td><strong>#{row['metric_name']}</strong><br/>(#{row['metric_type']}"
      if row['interval'] != nil
        metric_string += " every #{row['interval']} seconds"
      end
      metric_string += ")</td><td>#{row['description'].gsub '^', ' to the '}"
      if row['unit_name'] != nil
        metric_string += "<br/>shown as #{row['unit_name']}"
        if row['per_unit_name'] != nil
          metric_string += "/#{row['per_unit_name']}"
        end
      end

      metric_string += "</td></tr>"
  end
  metric_string+="</table>"
  return metric_string
end

def get_metrics_from_git
  if ENV.has_key?('github_personal_token')
    ititle = @item[:git_integration_title]

    itext = $client.contents('datadog/dogweb', :path => "integration/"+ititle+"/"+ititle+"_metadata.csv").content
    # return Base64.decode64(client.contents('datadog/dogweb', :path => "integration/"+@item[:git_integration_title]+"/desc.mako"))
    # return Base64.decode64(itext) #.gsub!(/<%(inherit|include)[^>]*\/>|<%def[^>]*>[^<]*<\/%def>/, '')

    output = parse_metrics(itext)
  else
    output = "<strong>Metrics table is auto-populated based on data from a Datadog internal repo. It will be populated when built into production.</strong>"
  end

return output
end

def get_units_from_git
  startunits = Time.now
  if ENV.has_key?('github_personal_token')
    itext = $client.contents('datadog/dogweb', :path => "integration/system/units_catalog.csv").content
    unit_string = ""
    units_by_family = Hash.new([])
    CSV.parse(Base64.decode64(itext), :headers => true) do |row|
      # row.each do |unit_id, family, name, plural, short_name, scale_factor|
      if units_by_family.has_key?(row['family'])
        units_by_family[row['family']].push(row['name'])
      else
        units_by_family[row['family']] = [row['name']]
      end

    end

    units_by_family.keys.each do |family|
      unit_string += "<h2>#{family}</h2>"
      units_by_family[family].each do |unit_name|
        unit_string += "<ul>"
        unit_string += "<li>#{unit_name}</li>"
        unit_string += "</ul>"
      end
    end
    output = unit_string
  else
    output = "<strong>Units is auto-populated based on data from a Datadog internal repo. It will be populated when built into production.</strong>"
    # raise "Github personal token required"
  end
print_profile("Get Units", startunits)
return output
end
