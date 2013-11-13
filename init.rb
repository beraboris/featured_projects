# encoding: utf-8
require 'redmine'

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'featured_projects/hooks'

  require_dependency 'project'
  Project.send(:include, FeaturedProjects::Patches::ProjectPatch)
end

Redmine::Plugin.register :featured_projects do
  name 'Featured Projects'
  author 'Enrique García, renemilk, Boris Bera'
  description 'Redmine featured projects'
  version '1.0.0'
end
