# Redmine sample plugin
require 'redmine'
require 'dispatcher'


ActionDispatch::Callbacks.to_prepare do
  require_dependency 'featured_projects/hooks'

  require_dependency 'project'
  Project.send(:include, FeaturedProjects::Patches::ProjectPatch)

  require_dependency 'welcome_controller'
  unless WelcomeController.included_modules.include? FeaturedProjects::Patches::WelcomeControllerPatch
    WelcomeController.send(:include, FeaturedProjects::Patches::WelcomeControllerPatch)
  end

end

Redmine::Plugin.register :featured_projects do
  name 'Featured Projects'
  author 'Enrique García'
  description 'Redmine featured projects'
  version '0.0.1'
end
