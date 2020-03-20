module RecordModule
  class RecordCompareService
    def initialize(previous_record, current_record)
      @previous_record = previous_record
      @current_record  = current_record
    end

    def call
      return {
        project_id: @current_record[:project_id],
        project_progress: {previous: @previous_record[:progress] ,current: @current_record[:progress]},
        sprints_status: sprints_done, #{ done: "sprint_id" ou "none", started: "sprint_id" ou "none"}
        previous_sprint_progress: @previous_record[:sprints].sort_by {|sprint| sprint[:title]}[@previous_record[:current_sprint]][:progress],
        current_sprint_progress: @current_record[:sprints].sort_by {|sprint| sprint[:title]}[@current_record[:current_sprint]][:progress],
        user_stories_status: user_stories_done #{user_story_id: , previous_status: , current_status: }
        #tasks_status: [{task_id: "fff", previous: "status or none", current: "to do, or done"}]
      }
    end

    def sprints_done
      if @current_record[:current_sprint] > @previous_record[:current_sprint]
        {
          done: @previous_record[:sprints][@previous_record[:current_sprint]][:sprint_id],
          started: @current_record[:sprints][@current_record[:current_sprint]][:sprint_id]
        }
      else
        {
          done: "none",
          started: "none"
        }
      end
    end

    def user_stories_done
      if @current_record[:current_sprint] == @previous_record[:current_sprint]
        sprint_index     = @current_record[:current_sprint]
        previous_us_list = @previous_record[:sprints].sort_by {|sprint| sprint[:title]}[sprint_index][:user_stories]
        current_us_list  = @current_record[:sprints].sort_by {|sprint| sprint[:title]}[sprint_index][:user_stories]
        us_list = []

        current_us_list.first(previous_us_list.count).each_with_index do |user_story, index|
          if previous_us_list[index][:status] != user_story[:status]
            us_list << {
            user_story_id: user_story[:user_story_id],
            previous_status: previous_us_list[index][:status],
            current_status: user_story[:status]
            }
          end
        end

        current_us_list.last(current_us_list.count - previous_us_list.count).each do |user_story|
          us_list << {
            user_story_id: user_story[:user_story_id],
            previous_status: "none",
            current_status: user_story[:status]
          }
        end
        us_list
        # previous_us = previous_us_list.map { |user_story| {user_story[:user_story_id]: user_story[:status]} }
        # {done: [US1_id, US2_id], started: [US3_id, US4_id]}
      end
    end
  end
end
