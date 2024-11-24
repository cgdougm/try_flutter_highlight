const Map<String, String> sampleCodes = {
  // Markdown Language
  'Markdown': '''
# Hello, World!

## This is a second level heading

> This is a block quote.
>
> It can span multiple paragraphs,
> if you like.

* This is a list item.
* This is another one.

---

Here is some inline `code`.

```dart
main() {
  print("Hello, World!");
}
```
''',

  // Dart Language
  'Dart': '''
void main() {
  final items = <String>['Apple', 'Banana', 'Orange'];
  
  // Using a for-in loop
  for (final fruit in items) {
    print('I love \$fruit!');
  }
  
  // Using higher-order functions
  items.where((fruit) => fruit.startsWith('A'))
       .forEach(print);
}
''',

  // Python Language
  'Python': '''
def quicksort(arr):
    if len(arr) <= 1:
        return arr
    pivot = arr[len(arr) // 2]
    left = [x for x in arr if x < pivot]
    middle = [x for x in arr if x == pivot]
    right = [x for x in arr if x > pivot]
    return quicksort(left) + middle + quicksort(right)

# Example usage
numbers = [3, 6, 8, 10, 1, 2, 1]
sorted_nums = quicksort(numbers)
print(f"Sorted array: {sorted_nums}")
''',

  // Bash Language
  'Bash': '''
#!/bin/bash

# Function to backup files
backup_files() {
    local source_dir="\$1"
    local backup_dir="\$2"
    local timestamp=\$(date +%Y%m%d_%H%M%S)
    
    echo "Backing up \$source_dir to \$backup_dir/backup_\$timestamp"
    
    # Create backup directory if it doesn't exist
    mkdir -p "\$backup_dir"
    
    # Create the backup
    tar -czf "\$backup_dir/backup_\$timestamp.tar.gz" "\$source_dir"
    
    if [ \$? -eq 0 ]; then
        echo "Backup completed successfully"
    else
        echo "Backup failed"
    fi
}

# Example usage
backup_files "/home/user/documents" "/backup"
''',

  // C++ Language
  'C++': '''
#include <iostream>
#include <vector>
#include <algorithm>

class Shape {
public:
    virtual double area() const = 0;
    virtual ~Shape() = default;
};

class Circle : public Shape {
private:
    double radius;
    
public:
    Circle(double r) : radius(r) {}
    
    double area() const override {
        return 3.14159 * radius * radius;
    }
};

int main() {
    std::vector<std::unique_ptr<Shape>> shapes;
    shapes.push_back(std::make_unique<Circle>(5));
    
    for (const auto& shape : shapes)
        std::cout << "Area: " << shape->area() << std::endl;
    
    return 0;
}
''',

  // JavaScript Language
  'JavaScript': '''
// Example of modern JavaScript features
class TaskManager {
  constructor() {
    this.tasks = new Map();
  }

  addTask(id, description) {
    this.tasks.set(id, {
      description,
      completed: false,
      createdAt: new Date()
    });
  }

  async fetchAndProcessTasks() {
    try {
      const response = await fetch('https://api.example.com/tasks');
      const data = await response.json();
      
      // Using array methods
      return data
        .filter(task => !task.completed)
        .map(task => ({
          ...task,
          priority: task.urgent ? 'high' : 'normal'
        }));
    } catch (error) {
      console.error(`Error processing tasks: \${error.message}`);
    }
  }
}

// Usage example
const manager = new TaskManager();
manager.addTask(1, 'Learn JavaScript');
manager.fetchAndProcessTasks()
  .then(tasks => console.log(tasks));
''',
}; 