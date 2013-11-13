module FeaturedProjects
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_projects_form, :partial => 'hooks/projects/featured_project_fields'

    def view_welcome_index_right(context)
      featured_projects = Project.featured.all
      context[:hook_caller].render :partial => 'hooks/welcome/featured_projects', :locals => { :featured_projects => featured_projects }
    end
  end
end
