include Nanoc::Helpers::XMLSitemap
include Nanoc::Helpers::Rendering
include Nanoc::Helpers::LinkTo
include Nanoc::Toolbox::Helpers::TaggingExtra
include Nanoc::Toolbox::Helpers::HtmlTag

# general functions

def collect_example_items
  @items.select { |item| item[:kind] == 'example' && !(item.identifier.match('/ja/')) }
end

def collect_video_items
  @items.select { |item| item[:kind] == 'video' && !(item.identifier.match('/ja/')) }
end

def collect_integration_items
  integrations = @items.select { |item| item[:kind] == 'integration' && !(item.identifier.match('/ja/')) }
  integrations.sort_by { |i| i[:integration_title].downcase }
  # $all_itegration_items = integrations
end

def collect_guide_items
  guides = @items.select{ |item| item[:kind] == 'guide' && item[:listorder] != nil && !(item.identifier.match('/ja/')) }
  guides.sort_by { |item| item[:listorder] }
end

# Japanese specific functions
def collect_ja_example_items
  @items.select { |item| item[:kind] == 'example' && item[:language] == 'ja' && item.identifier.match('/ja/') }
end

def collect_ja_video_items
  @items.select { |item| item[:kind] == 'video' && item[:language] == 'ja' && item.identifier.match('/ja/') }
end

def collect_ja_integration_items
  integrations = @items.select { |item| item[:kind] == 'integration' && item[:language] == 'ja' && item.identifier.match('/ja/') }
  integrations.sort_by { |i| i[:integration_title].downcase }
end

def collect_ja_guide_items
  guides = @items.select{ |item| item[:kind] == 'guide' && item[:listorder] != nil && item[:language] == 'ja' && item[:translation_status] == "complete" && item.identifier.match('/ja/') }
  guides.sort_by { |item| item[:listorder] }
end

def ja_guide_items_yet
  guides = @items.select{ |item| item[:kind] == 'guide' && item[:listorder] != nil && item[:language] == nil }
  guides_translated = @items.select{ |item| item[:kind] == 'guide' && item[:listorder] != nil && item[:language] == 'ja' && item[:translation_status] == "complete" && item.identifier.match('/ja/') }

  guides_translated.each do |jp_content|
    guides.each do |en_content|
      if jp_content.identifier.split('/')[-1] == en_content.identifier.split('/')[-1]
        guides.delete(en_content)
        # p jp_content.identifier.split('/')[-1]
      end
    end
  end

  guides.sort_by { |item| item[:listorder] }
end


def get_cache_bust_fingerprints
  cbfingerprints = Hash.new()
  @items.each do |item|
    if item.identifier.match("bootstrap3")
      cbfingerprints["bootstrap3"] = fingerprint(item[:filename])
    elsif item.identifier.match("style")
      cbfingerprints["style"] = fingerprint(item[:filename])
    end
  end
  return cbfingerprints
end

def create_redirect_pages
  if @config.key?(:redirects)
    if !@config[:redirects].to_a.empty?
      @config[:redirects].each do |redirect|
        raw_content = <<EOF
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <title>#{redirect[:from]}</title>
    <meta http-equiv="refresh" content="0;URL='#{redirect[:to]}'" />
  </head>
  <body>
    <p>This page has moved to <a href="#{redirect[:to]}">#{redirect[:to]}</a>.</p>
  </body>
</html>
EOF
        @items << Nanoc::Item.new(
            raw_content,
            {
              :title => "redirect"
            },
            redirect[:from],
            :binary => false
          )
      end
    end
  end
end

# def create_tag_pages(items=nil, options={})
#       options[:tag_pattern]     ||= "%%tag%%"
#       options[:title]           ||= options[:tag_pattern]
#       options[:identifier]      ||= "/tags/#{options[:tag_pattern]}/"
#       options[:template]        ||= "tag"

#       tag_set(items).each do |tagname|
#         raw_content = "<%= render('#{options[:template]}', :tag => '#{tagname}') %>"
#         attributes  = { :title => options[:title].gsub(options[:tag_pattern], tagname) }
#         identifier  = options[:identifier].gsub(options[:tag_pattern], tagname)

#         @items << Nanoc::Item.new(raw_content, attributes, identifier, :binary => false)
#       end
#     end
