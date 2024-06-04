actor ToDoList {

  type Task = {
    id : Nat;
    description : Text;
    completed : Bool;
  };

  var tasks : [Task] = [];

  public func addTask(description : Text) : async Nat {
    let id = Array.length(tasks) + 1;
    let newTask = { id = id; description = description; completed = false };
    tasks := tasks # [newTask];
    return id;
  };

  public func completeTask(taskId : Nat) : async Bool {
    let index = findTaskIndex(taskId);
    switch (index) {
      case (?i) {
        tasks[i].completed := true;
        return true;
      };
      case null {
        return false;
      };
    }
  };

  public func getTasks() : async [Task] {
    return tasks;
  };

  private func findTaskIndex(taskId : Nat) : ?Nat {
    var index = 0;
    while (index < Array.length(tasks)) {
      if (tasks[index].id == taskId) {
        return index;
      }
      index += 1;
    }
    return null;
  };

};



  private func findVoteIndex(option : Text) : ?Nat {
    var index = 0;
    while (index < Array.length(votes)) {
      if (votes[index].option == option) {
        return index;
      }
      index += 1;
    }
    return null;
  };

};
