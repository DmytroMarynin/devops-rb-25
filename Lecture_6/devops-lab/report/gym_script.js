// Перехід до бази
db = db.getSiblingDB("gymDatabase");

// Колекція clients
db.clients.insertMany([
  { client_id: 1, name: "Ivan Petrenko", age: 35, email: "ivan@example.com" },
  { client_id: 2, name: "Olga Shevchenko", age: 28, email: "olga@example.com" },
  { client_id: 3, name: "Andriy Bondar", age: 42, email: "andriy@example.com" }
]);

// Колекція memberships
db.memberships.insertMany([
  { membership_id: 101, client_id: 1, start_date: "2024-01-01", end_date: "2024-12-31", type: "Annual" },
  { membership_id: 102, client_id: 2, start_date: "2024-06-01", end_date: "2024-09-01", type: "Summer" },
  { membership_id: 103, client_id: 3, start_date: "2024-03-01", end_date: "2024-09-01", type: "Half-year" }
]);

// Колекція workouts
db.workouts.insertMany([
  { workout_id: 201, description: "Cardio endurance", difficulty: "Medium" },
  { workout_id: 202, description: "Weight lifting", difficulty: "Hard" },
  { workout_id: 203, description: "Yoga and stretching", difficulty: "Easy" }
]);

// Колекція trainers
db.trainers.insertMany([
  { trainer_id: 301, name: "Svitlana Kravets", specialization: "Cardio" },
  { trainer_id: 302, name: "Dmytro Marchenko", specialization: "Strength" }
]);
