module ProgressModule
  class CurrentSprintService
    def initialize(project)
      @project = project
    end

    def call
      last_sprint_done = @project.sprints.find_by(done: true)
      if last_sprint_done
        last_sprint_done_index = @project.sprints.index(last_sprint_done) + 1
        if last_sprint_done_index == @project.sprints.count
          last_sprint_done_index
        else
          last_sprint_done_index + 1
        end
      else
        return 1
      end
    end

  end
end
