Gem::Specification.new do |s|
    s.name        = 'jekyll-wowaffixes'
    s.version     = '1.0.0'
    s.date        = '2019-04-04'
    s.summary     = "WoW Mythic+ affixes for Jekyll. Calculates affixes list for previous, current and next weeks. Supporing EU & US regions"
    s.description = "WoW Mythic+ affixes for Jekyll. Calculates affixes list for previous, current and next weeks. Supporing EU & US regions"
    s.authors     = ["Nikita Chernyi"]
    s.email       = 'github@rakshazi.me'
    s.files       = `git ls-files`.split($INPUT_RECORD_SEPARATOR).grep(%r!^lib/!)
    s.require_paths = %w(lib)
    s.homepage    = 'https://github.com/forestguild/affixes'
    s.license     = 'MIT'
    s.metadata = {
        "bug_tracker_uri"   => "https://github.com/forestguild/affixes",
        "changelog_uri"     => "https://github.com/forestguild/affixes/releases",
        "documentation_uri" => "https://github.com/forestguild/affixes/blob/master/README.md",
        "homepage_uri"      => "https://github.com/forestguild/affixes",
        "source_code_uri"   => "https://github.com/forestguild/affixes",
    }
    s.required_ruby_version = '>=2.0.0'
    s.add_runtime_dependency 'jekyll', '~> 3.8.5', '>=3.0.0'
    s.add_runtime_dependency 'chronic', '~> 0.10.2', '>=0.10.0'
end
