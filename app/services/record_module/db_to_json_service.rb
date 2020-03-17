module RecordModule
  class DbToJsonService
    def initialize(project)
      @project = project
    end

    def call
      sprints_to_db = @project.sprints.map do |sprint|
        sprint_to_project = sprint_to_hash(sprint)

        user_stories_to_db = sprint.user_stories.map do |user_story|
          user_story_to_sprint = user_story_to_hash(user_story)
          tasks_to_db = user_story.tasks.map { |task| task_to_hash(task) }
          user_story_to_sprint[:tasks] = tasks_to_db
          user_story_to_sprint
        end

        sprint_to_project[:user_stories] = user_stories_to_db
        sprint_to_project
      end

      db_record = project_to_hash(project)
      db_record[:sprints] = sprints_to_db
      db_record

    end

    def task_to_hash(task)
      {
        task_id: task.id,
        title: task.title,
        current_status: task.current_status,
        created_at: task.created_at,
        updated_at: task.updated_at
      }
    end

    def user_story_to_hash(user_story)
      {
        user_story_id: user_story.id,
        done: user_story.done,
        status: user_story.current_status,
        title: user_story.title,
        updated_at: user_story.updated_at,
        progress: ProgressModule::ProjectProgressService.new(user_story)
        tasks: []
      }
    end

    def sprint_to_hash(sprint)
      {
        sprint_id: sprint.id,
        title: sprint.title,
        done: sprint.done,
        updated_at: sprint.updated_at,
        progress: ProgressModule::ProjectProgressService.new(sprint)
        user_stories: []
      }
    end

    def project_to_hash(project)
      {
        project_id: project.id,
        done: project.done,
        updated_at: project.updated_at,
        progress: ProgressModule::ProjectProgressService.new(project)
        current_sprint: current_sprint(project)
        sprints: []
      }
    end

    def current_sprint(project)
      last_sprint_done = project.sprints.find_by(done: true)
      if last_sprint_done
        last_sprint_done_index = @project.sprints.index(last_sprint_done)
      else
        return 0
      end
    end




  # saved_db = {
  #   project_id: ,
  #   done: ,
  #   updated_at: ,
  #   progress: ,
  #   current_sprint: ,
  #   sprints: [{
  #     sprint_id: ,
  #     title: ,
  #     done:
  #     updated_at:
  #     user_stories: [{
  #       user_story_id: ,
  #       done: ,
  #       status: ,
  #       title: ,
  #       updated_at:
  #       tasks: [{
  #         task_id: ,
  #         title: ,
  #         current_status: ,
  #         created_at: ,
  #         updated_at:
  #       }]

  #     }]
  #   }]
  # }

  end
end
