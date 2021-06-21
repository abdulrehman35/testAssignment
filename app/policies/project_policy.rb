class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.has_role? :Admin
        Project.all.order("created_at DESC")
      else
        @user.projects

      end

    end
  end

  # def show?

  #   (@user.has_role? :Admin) || (@user.project_ids.include? @project.id)
  # end

  def new?
    #debugger
    @user.has_role? :Admin
  end

  def edit?
    @user.has_role? :Admin
  end

  def destroy?
    @user.has_role? :Admin
  end
end
