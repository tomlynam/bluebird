if Rails.env.development?
	twitter = "#{Rails.root}/config/twitter.yml"
	if File.exists? twitter
		config = YAML.load_file(twitter)
		config.each { |key, value| ENV[key] = value }
	else
		raise "How do you expect this app to work without twitter.yml?"
	end
end
