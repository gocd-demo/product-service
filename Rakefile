require 'erb'

def get_var(name)
  if ENV[name].to_s.strip.empty?
    raise "environment #{name} not specified!"
  else
    ENV[name]
  end
end

task :create_docker_image do
  username = get_var('DOCKERHUB_ORG')
  go_pipeline_label = get_var('GO_PIPELINE_LABEL')
  sh("docker build . -t #{username}/artifact_demo:#{go_pipeline_label}")
end

task :clean_up_image do
  go_dependency_label = get_var('GO_DEPENDENCY_LABEL_UPSTREAM')
  sh("docker rmi -f #{username}/artifact_demo:#{go_dependency_label} || true")
end

task :create_json do
  username = get_var('DOCKERHUB_ORG')
  go_pipeline_label = get_var('GO_PIPELINE_LABEL')
  template = File.read('artifact_info.json.erb')
  renderer = ERB.new(template, nil, '-')
  File.open('artifact_info.json', 'w') do |f|
    f.puts(renderer.result(binding))
  end
end

task :prettify_k8s_status do
  filename = get_var('FILENAME')
  template = File.read('status.html.erb')
  renderer = ERB.new(template, nil, '-')
  File.open('status.html', 'w') do |f|
    f.puts(renderer.result(binding))
  end
end