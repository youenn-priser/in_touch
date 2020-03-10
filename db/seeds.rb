# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning the DB......"
Task.destroy_all
UserStory.destroy_all
Sprint.destroy_all
User.destroy_all
Client.destroy_all
Report.destroy_all
Project.destroy_all
print "OK"


puts "Seeding the DB......"

pierre        = Client.create!(first_name: 'Pierre', last_name: 'Facq', email: 'pierre@lewagon.org', company: 'Le Wagon Nantes', phone: '0622796973')
yoichi        = User.create!(email: 'yoichi.trigalot@gmail.com')
marketplace   = Project.create!(title: 'AirMasknShare', client: pierre, user: yoichi)

report_first  = Report.create!(project: marketplace, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', status: 'sent')
report_second = Report.create!(project: marketplace, description: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat...', status: 'draft')
report_third  = Report.create!(project: marketplace, description: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', status: 'sent')

# Sprint 1
renter_sprint = Sprint.create!(title: 'Renter Part', project: marketplace, done: true)
user_story_first  = UserStory.create!(title: "En tant que mask renter je veux me connecter / créer mon compte afin de pouvoir réserver", done: true, sprint: renter_sprint)
task_first             = Task.create!(title: "Configurer Devise", weight: 3, current_status: "done", user_story: user_story_first)
task_second            = Task.create!(title: "Gérer le modèle USER", weight: 1, current_status: "done", user_story: user_story_first)
task_third             = Task.create!(title: "Revoir le design des pages de log in", weight: 3, current_status: "done", user_story: user_story_first)

user_story_second = UserStory.create!(title: "En tant que mask renter je veux voir la liste des masks disponibles", done: true, sprint: renter_sprint)
task_fourth            = Task.create!(title: "Créer l'index", weight: 1, current_status: "done", user_story: user_story_second)
task_fifth             = Task.create!(title: "Configurer la map", weight: 5, current_status: "done", user_story: user_story_second)
task_sixth             = Task.create!(title: "Revoir le design des mask cards", weight: 5, current_status: "done", user_story: user_story_second)

user_story_third  = UserStory.create!(title: "En tant que mask renter je veux voir le detail du mask afin de m'aider à choisir le mask ou non", done: true, sprint: renter_sprint)
task_seventh           = Task.create!(title: "Créer la show", weight: 5, current_status: "done", user_story: user_story_third)
task_eighth            = Task.create!(title: "Linker la show à l'index", weight: 1, current_status: "done", user_story: user_story_third)
task_ninth             = Task.create!(title: "Ajouter un bouton back", weight: 1, current_status: "done", user_story: user_story_third)
task_tenth             = Task.create!(title: "Designer la show", weight: 3, current_status: "done", user_story: user_story_third)

user_story_fourth = UserStory.create!(title: "En tant que mask renter je veux réserver un mask afin de me protéger de virus potentiel / d'aller à une soirée déguisée", done: true, sprint: renter_sprint)
task_eleventh          = Task.create!(title: "Créer la create de booking", weight: 3, current_status: "done", user_story: user_story_fourth)
task_twelth            = Task.create!(title: "Designer la page mes réservation", weight: 3, current_status: "done", user_story: user_story_fourth)

# Sprint 2
owner_sprint  = Sprint.create!(title: 'Owner Part', project: marketplace)
user_story_fifth  = UserStory.create!(title: "En tant que mask owner je veux rajouter un mask (description / photo / adresse pour la geolocalisation / nbr d'utilisation) afin de le proposer sur la market place", done: true, sprint: owner_sprint)
task_thirteenth        = Task.create!(title: "Ajouter create pour les masks", weight: 5, current_status: "in progress", user_story: user_story_fifth)
task_fourteenth        = Task.create!(title: "Ajouter edit pour les masks", weight: 5, current_status: "in progress", user_story: user_story_fifth)
task_fifteenth         = Task.create!(title: "Ajouter update pour les masks", weight: 5, current_status: "in progress", user_story: user_story_fifth)
task_sixteenth         = Task.create!(title: "Ajouter destroy pour les masks", weight: 5, current_status: "in progress", user_story: user_story_fifth)

user_story_sixth  = UserStory.create!(title: "En tant que mask owner je veux pouvoir voir mes masks", sprint: owner_sprint)
task_seventeenth       = Task.create!(title: "Ajouter index", weight: 5, current_status: "to do", user_story: user_story_sixth)

user_story_seventh = UserStory.create!(title: "En tant que mask owner je veux je veux pouvoir accepter/refuser le booking de l'utilisateur afin de pouvoir manager facilement mes masks", sprint: owner_sprint)
task_eighteenth        = Task.create!(title: "Ajouter l'Edit des bookings", weight: 3, current_status: "waiting client", user_story: user_story_seventh)
task_nineteenth        = Task.create!(title: "Ajouter l'update des bookings", weight: 3, current_status: "waiting client", user_story: user_story_seventh)

user_story_eighth  = UserStory.create!(title: "En tant que mask owner je veux voir mes reservations afin de d'avoir une vue d'ensemble", sprint: owner_sprint)
task_twentieth         = Task.create!(title: "Ajouter l'index des bookings", weight: 3, current_status: "to do", user_story: user_story_eighth)

print "OK"
