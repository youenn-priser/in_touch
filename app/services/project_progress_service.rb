class ProjectProgressService
  def initialize(project)
    @tasks = project.tasks
  end

  def call
    #moyenne % d'avancement du projet general= (nbr de user story done * le poids) sur / (la somme du nombre de user story * le poids)
    tasks_weight_one   = @tasks.where(weight: 1).count * 1
    tasks_weight_three = @tasks.where(weight: 3).count * 3
    tasks_weight_five  = @tasks.where(weight: 5).count * 5

    weight_total = tasks_weight_one + tasks_weight_three + tasks_weight_five

    # calculer = poid total des tasks total
    # recuperer trois array en fonction poids
    # multiplierr le count de chaque array par le poids
    # additiopnner ces poids

    tasks_done = @tasks.where(current_status: "done")
    tasks_done_weight_one   = tasks_done.where(weight: 1).count * 1
    tasks_done_weight_three = tasks_done.where(weight: 3).count * 3
    tasks_done_weight_five  = tasks_done.where(weight: 5).count * 5

    weight_task_done_total = tasks_done_weight_one + tasks_done_weight_three + tasks_done_weight_five
    # calculer poids des tasks done

    progress = weight_total.positive? ? ((100 * weight_task_done_total) / weight_total) : 0

  end
end
