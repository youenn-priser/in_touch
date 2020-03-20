module RecordModule
  class MailTemplateService
    def initialize(project)
      @project = project
    end

    def call
      [greetings, project_progress, sprint_progress, in_progress, waiting_for_client, goodbye].join("\n")
    end

    private
    def greetings
      "Dear #{@project.client.first_name},"
    end

    def project_progress
      # The project is ongoing we are now approximatively about 50% done on the whole project.
      return "The project is ongoing we are now approximatively about #{ ProgressModule::ProjectProgressService.new(@project).call }% done on the whole project."
    end

    def sprint_progress
      # We are currently working on sprint 2.
      return "We are currently working on sprint #{ ProgressModule::CurrentSprintService.new(@project).call + 1 }."
    end

    def in_progress
      # More specifically, we are working on:
      # - As Mask owner, I want to add a mask (description / photo / adresse for geolocalisation / number of uses) in order to rent my mask
      # - As Mask owner, I want to see my masks
      # - As Mask owner, I want to manage my bookings : accept or not, bookings from users
      user_stories_list = @project.user_stories.where(current_status: "in progress").map do |us|
        "- #{us.title}"
      end
      unless user_stories_list.empty?
        "\n More specifically, we are working on:\n#{ user_stories_list.join("\n") }"
      end
    end

    def waiting_for_client
      # We are waiting for your review Sprint 1 | User story 4.
      # Please let us know if we need to change something or if everything is good.
      waiting_for_client_list = []
      @project.user_stories.each do |user_story|
        unless ProgressModule::UserStoryProgressService.new(user_story).call[:waiting_for_client].zero?
          waiting_for_client_list << "- #{user_story.title}"
        end
      end
      unless waiting_for_client_list.empty?
        "\n Your review is welcome on:\n#{ waiting_for_client_list.join("\n") }"
      end
    end

    def goodbye
      user_first_name = @project.user.name ? @project.user.name : @project.user.email.split(".").first.capitalize
      "Have a great day,\nRegards,\n#{user_first_name}"
    end
  end
end
