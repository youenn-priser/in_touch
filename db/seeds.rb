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
thibault      = User.create!(email: 'thibault@nolex.app')
marketplace   = Project.create!(title: 'AirMasknShare', client: pierre, user: thibault, trello_board_url: "https://trello.com/b/sWMxmcEO/airmasknshare")

report_first  = Report.create!(project: marketplace, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
report_second = Report.create!(project: marketplace, description: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat...')
report_third  = Report.create!(project: marketplace, description: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?')

# Sprint 1
renter_sprint = Sprint.create!(title: 'Renter Part', project: marketplace, done: true)
user_story_first  = UserStory.create!(title: "As Mask renter, I want to login / create an acount in order to book a mask", current_status: 'done', done: true, sprint: renter_sprint)
task_first             = Task.create!(title: "Set Devise", weight: 3, current_status: "done", user_story: user_story_first)
task_second            = Task.create!(title: "Manage User model", weight: 1, current_status: "done", user_story: user_story_first)
task_third             = Task.create!(title: "Login pages to review", weight: 3, current_status: "done", user_story: user_story_first)

user_story_second = UserStory.create!(title: "As Mask renter, I want to see the list of avaliable masks", done: true, current_status: 'done', sprint: renter_sprint)
task_fourth            = Task.create!(title: "Create index page", weight: 1, current_status: "done", user_story: user_story_second)
task_fifth             = Task.create!(title: "Set the map", weight: 5, current_status: "done", user_story: user_story_second)
task_sixth             = Task.create!(title: "Mask cards Design to review", weight: 5, current_status: "done", user_story: user_story_second)

user_story_third  = UserStory.create!(title: "As Mask renter, I want to see mask details, in order to pick one that feet my needs", current_status: 'done', done: true, sprint: renter_sprint)
task_seventh           = Task.create!(title: "Create show page", weight: 5, current_status: "done", user_story: user_story_third)
task_eighth            = Task.create!(title: "Link show to index pages", weight: 1, current_status: "done", user_story: user_story_third)
task_ninth             = Task.create!(title: "Add back button", weight: 1, current_status: "done", user_story: user_story_third)
task_tenth             = Task.create!(title: "Design show page", weight: 3, current_status: "done", user_story: user_story_third)

user_story_fourth = UserStory.create!(title: "As Mask renter, I want to book a mask, to protect myself against COVID19 / go to costume party", current_status: 'done', done: true, sprint: renter_sprint)
task_eleventh          = Task.create!(title: "Create create/new page for Bookings", weight: 3, current_status: "done", user_story: user_story_fourth)
task_twelth            = Task.create!(title: "Design Bookings page", weight: 3, current_status: "done", user_story: user_story_fourth)

# Sprint 2
owner_sprint  = Sprint.create!(title: 'Owner Part', project: marketplace)
user_story_fifth  = UserStory.create!(title: "As Mask owner, I want to add a mask (description / photo / adresse for geolocalisation / number of uses) in order to rent my mask", current_status: 'in progress', done: false, sprint: owner_sprint)
task_thirteenth        = Task.create!(title: "Create create page for masks", weight: 5, current_status: "in progress", user_story: user_story_fifth)
task_fourteenth        = Task.create!(title: "Add edit button for masks", weight: 5, current_status: "in progress", user_story: user_story_fifth)
task_fifteenth         = Task.create!(title: "Add update button for masks", weight: 5, current_status: "waiting client", user_story: user_story_fifth)
task_sixteenth         = Task.create!(title: "Add destroy button for masks", weight: 5, current_status: "to do", user_story: user_story_fifth)

user_story_sixth  = UserStory.create!(title: "As Mask owner, I want to see my masks", done: false, current_status: 'in progress', sprint: owner_sprint)
task_seventeenth       = Task.create!(title: "Add index page", weight: 5, current_status: "to review/debug", user_story: user_story_sixth)

user_story_seventh = UserStory.create!(title: "As Mask owner, I want to manage my bookings : accept or not, bookings from users", done: false, current_status: 'in progress', sprint: owner_sprint)
task_eighteenth        = Task.create!(title: "Add edit button on mask card in Bookings", weight: 3, current_status: "in progress", user_story: user_story_seventh)
task_nineteenth        = Task.create!(title: "Add update in bookings", weight: 3, current_status: "waiting client", user_story: user_story_seventh)

user_story_eighth  = UserStory.create!(title: "As Mask owner, I want to see all my rentals, in one place", done: false, current_status: 'to do', sprint: owner_sprint)
task_twentieth         = Task.create!(title: "Add index view for bookings", weight: 3, current_status: "to do", user_story: user_story_eighth)

print "OK"
