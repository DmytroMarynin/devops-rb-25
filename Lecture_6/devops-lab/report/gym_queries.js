// Підключення до бази
db = db.getSiblingDB("gymDatabase");

print("=== Клієнти віком понад 30 років ===");
printjson(db.clients.find({ age: { $gt: 30 } }).toArray());

print("=== Тренування із середньою складністю ===");
printjson(db.workouts.find({ difficulty: "Medium" }).toArray());

print("=== Членство для клієнта з client_id = 2 ===");
printjson(db.memberships.find({ client_id: 2 }).toArray());
