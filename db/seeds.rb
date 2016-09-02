# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.connection.execute("TRUNCATE reasons RESTART IDENTITY");
ActiveRecord::Base.connection.execute("TRUNCATE responses RESTART IDENTITY");
ActiveRecord::Base.connection.execute("TRUNCATE solutions RESTART IDENTITY");
ActiveRecord::Base.connection.execute("TRUNCATE reminders RESTART IDENTITY");
ActiveRecord::Base.connection.execute("TRUNCATE sensitivities RESTART IDENTITY");
ActiveRecord::Base.connection.execute("TRUNCATE triggers RESTART IDENTITY");



reasons = Reason.create([
  { stress_reason: 'school/work' },
  { stress_reason: 'bullying' },
  { stress_reason: 'friends' },
  { stress_reason: 'finance' },
  { stress_reason: 'family' },
  { stress_reason: 'love/companionship' },
  { stress_reason: 'loss' },
  { stress_reason: 'self image' },
  { stress_reason: 'health' },
])

responses = Response.create([
  { content: 'At least you still have all your teeth.' }, #1 funny
  { content: 'Never let anyone treat you like a yellow starburst.  You are a pink starbust.' }, #2 funny
  { content: "How to handle stress like a dog. If you cannot eat it or play with it, then pee on it and walk away" }, #3 funny
  { content: "Whenever you're feeling down, remember that you are the sperm that won." }, #4 funny
  { content: "Sleep when you're dead." }, #5 funny
  { content: 'Opportunity does not knock, it presents itself when you beat down the door.' }, #6 realistic
  { content: 'Life is rough. Get over it.' }, #7 tough love
  { content: 'Suck it up.' }, #8 tough love
  { content: 'Some people just need a high-five...in the face...with a chair.' }, #9 tough love
  { content: "Inspiration is a guest that does not willingly visit the lazy" }, #10 tough love
  { content: 'You are a champion.' }, #11 pick-me-up
  { content: "Life is tough. So are you." }, #12 pick-me-up
  { content: "If plan 'A' didn't work, then there are 25 more letters left." }, #13 pick-me-up
  { content: "Don't let yesterday take up too much of today." }, #14 pick-me-up
  { content: 'You will get through this.' }, #15 pick-me-up, realistic
  { content: "If you're not willing to change, then don't expect your life to." }, #16 tough love, realistic
  { content: "Stop complaining, get off your ass, and do something about it." }, #17 tough love, realistic
])

sensitivities = Sensitivity.create([
  { level: 'humor' },    # 1
  { level: 'realistic' }, # 2 witty
  { level: 'tough love' }, # 3 
  { level: 'pick-me-up' }, # 4 sensitive
])

solutions = Solution.create([
  { response: Response.first, sensitivity: Sensitivity.first },
  { response: Response.second, sensitivity: Sensitivity.first },
  { response: Response.third, sensitivity: Sensitivity.first },
  { response: Response.fourth, sensitivity: Sensitivity.first },
  { response: Response.fifth, sensitivity: Sensitivity.first },
  { response: Response.find(6), sensitivity: Sensitivity.second },
  { response: Response.find(7), sensitivity: Sensitivity.third },
  { response: Response.find(8), sensitivity: Sensitivity.third },
  { response: Response.find(9), sensitivity: Sensitivity.third },
  { response: Response.find(10), sensitivity: Sensitivity.third },
  { response: Response.find(11), sensitivity: Sensitivity.fourth },
  { response: Response.find(12), sensitivity: Sensitivity.fourth },
  { response: Response.find(13), sensitivity: Sensitivity.fourth },
  { response: Response.find(14), sensitivity: Sensitivity.fourth },
  { response: Response.find(15), sensitivity: Sensitivity.fourth },
  { response: Response.find(15), sensitivity: Sensitivity.second },
  { response: Response.find(16), sensitivity: Sensitivity.fourth },
  { response: Response.find(16), sensitivity: Sensitivity.third },
  { response: Response.find(17), sensitivity: Sensitivity.second },
  { response: Response.find(17), sensitivity: Sensitivity.third },
])

reminders = Reminder.create([
  { reminder_type: 'quote' },
  { reminder_type: 'exercise' },
  { reminder_type: 'mindful moment' },
])


triggers = Trigger.create([
  { sensitivity: Sensitivity.first, content: 'Humor me' }, # humor
  { sensitivity: Sensitivity.first, content: 'Make me laugh' }, # humor
  { sensitivity: Sensitivity.first, content: 'Give it to me' }, # humor
  { sensitivity: Sensitivity.second, content: 'I really need help' }, # realistic
  { sensitivity: Sensitivity.fourth, content: 'Hit me with your best shot' }, # pick me up
  { sensitivity: Sensitivity.fourth, content: 'Compliment me' }, # pick-me-up
  { sensitivity: Sensitivity.first, content: 'I am desperate' }, # humor
  { sensitivity: Sensitivity.second, content: 'Talk to me' }, # realistic
  { sensitivity: Sensitivity.third, content: 'You asked for it' }, # tough love
  { sensitivity: Sensitivity.third, content: 'Brace yourself' }, # tough love
  { sensitivity: Sensitivity.fourth, content: "Today's going to be a good day" }, # pick-me-up
  { sensitivity: Sensitivity.third, content: "Toughen me up" }, # tough love
  { sensitivity: Sensitivity.second, content: "Let's be realistic" }, # realistic
])

users = User.create([
  { handle: 'bobby', first_name: 'Bob', last_name: 'Bobby', email: 'bob@bobby.com', password: 'password', password_confirmation: 'password', location: 94539 }
])

