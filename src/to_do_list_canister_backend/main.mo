import HashMap "mo:base/HashMap";
import Nat "mo:base/Nat";
import Text "mo:base/Text";

actor TodoList {
    type Task = {
        id : Nat;
        title : Text;
        completed : Bool;
    };

    let tasks = HashMap.HashMap<Nat, Task>(0, Nat.equal, Hash.hash);

    public func createTask(title : Text) : async Nat {
        let id = tasks.size();
        let task : Task = {
            id = id;
            title = title;
            completed = false;
        };
        tasks.put(id, task);
        return id;
    };

    public func markTaskAsCompleted(id : Nat) : async () {
        switch (tasks.get(id)) {
            case (?task) {
                let updatedTask = { id = task.id; title = task.title; completed = true };
                tasks.put(id, updatedTask);
            };
            case (null) {
                return;
            };
        };
    };

    public query func getTasks() : async [Task] {
        return HashMap.toArray(tasks);
    };
}

