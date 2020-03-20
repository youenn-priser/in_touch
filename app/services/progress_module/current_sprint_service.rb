module ProgressModule
  class CurrentSprintService
    def initialize(project)
      @project = project
    end

    def call
      last_sprint_done = @project.sprints.order(:title).where(done: true).last
      if last_sprint_done
        last_sprint_done_index = @project.sprints.order(:title).index(last_sprint_done) + 1
        # if last_sprint_done_index == @project.sprints.count
        #   last_sprint_done_index
        # else
        #   last_sprint_done_index + 1
        # end
      else
        return 0
      end
    end

  end
end
