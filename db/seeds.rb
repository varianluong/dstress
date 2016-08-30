# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
  { content: 'You will get through this.' },
  { content: 'Suck it up.' },
])

solutions = Solution.create([
  { reason: Reason.first, response: Response.first },
])

reminders = Reminder.create([
  { reminder_type: 'quote' },
  { reminder_type: 'exercise' },
  { reminder_type: 'mindful moment' },
])

sensitivities = Sensitivity.create([
  { level: 'humor' },
  { level: 'realistic' },
  { level: 'tough love' },
  { level: 'pick-me-up' },
])

triggers = Trigger.create([
  { sensitivity: Sensitivity.first, content: 'Humor me' },
  { sensitivity: Sensitivity.second, content: 'Give it to me' },
  { sensitivity: Sensitivity.second, content: 'I really need help' },
  { sensitivity: Sensitivity.third, content: 'Hit me with your best shot' },
  { sensitivity: Sensitivity.fourth, content: 'Compliment me' },
])

