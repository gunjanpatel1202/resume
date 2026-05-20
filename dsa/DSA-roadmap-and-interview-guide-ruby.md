# DSA Roadmap & Interview Guide with Ruby

---

## Part 1: DSA (Data Structures & Algorithms) Roadmap with Ruby

This roadmap will guide you through learning DSA concepts using Ruby, progressing from easy to advanced. Each topic includes key questions and answers to reinforce your understanding.

### Table of Contents
1. Arrays & Strings
2. Linked Lists
3. Stacks & Queues
4. Hash Tables (Maps)
5. Recursion & Backtracking
6. Searching & Sorting
7. Trees (Binary, BST, Heap, Trie)
8. Graphs (BFS, DFS, Shortest Path)
9. Greedy Algorithms
10. Dynamic Programming
11. Advanced Topics (Segment Tree, Suffix Tree, Bit Manipulation)

---

### 1. Arrays & Strings

#### Q1: How do you reverse an array in Ruby?
```ruby
arr = [1, 2, 3, 4]
arr.reverse # => [4, 3, 2, 1]
```
**Explanation:**
The `reverse` method in Ruby reverses the order of elements in an array. It is a built-in method that simplifies reversing arrays without manually iterating through them.

**Learning Summary:**
- Understand how to use Ruby's built-in methods for common operations.
- Practice writing manual implementations to deepen understanding of array manipulation.

#### Q2: Find the maximum sum subarray (Kadane's Algorithm)
```ruby
def max_subarray_sum(arr)
  max_sum = arr[0]
  curr_sum = arr[0]
  arr[1..].each do |num|
    curr_sum = [num, curr_sum + num].max
    max_sum = [max_sum, curr_sum].max
  end
  max_sum
end
```
**Explanation:**
Kadane's Algorithm is used to find the maximum sum of a contiguous subarray in linear time. It works by maintaining two variables: `curr_sum` for the current subarray sum and `max_sum` for the maximum sum encountered so far.

**Learning Summary:**
- Learn how to optimize subarray problems using dynamic programming techniques.
- Understand the importance of maintaining intermediate results to achieve linear time complexity.

#### Q3: Check if a string is a palindrome
```ruby
def palindrome?(str)
  str == str.reverse
end
```
**Explanation:**
A palindrome is a string that reads the same backward as forward. This method compares the string with its reversed version to determine if it is a palindrome.

**Learning Summary:**
- Understand the concept of palindromes.
- Practice using Ruby's `reverse` method for string manipulation.

---

### 2. Linked Lists

#### Q1: How do you implement a singly linked list in Ruby?
```ruby
class Node
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end
```
**Explanation:**
A singly linked list is a data structure where each node points to the next node in the sequence. This implementation defines a `Node` class with `val` for the value and `next` for the pointer to the next node.

**Learning Summary:**
- Learn the structure of a singly linked list.
- Understand how to define and link nodes in Ruby.

#### Q2: Reverse a linked list
```ruby
def reverse_list(head)
  prev = nil
  curr = head
  while curr
    nxt = curr.next
    curr.next = prev
    prev = curr
    curr = nxt
  end
  prev
end
```
**Explanation:**
Reversing a linked list involves iterating through the list and reversing the direction of the `next` pointer for each node. The `prev` pointer keeps track of the reversed portion of the list.

**Learning Summary:**
- Practice pointer manipulation in linked lists.
- Understand iterative approaches to reversing linked lists.

---

### 3. Stacks & Queues

#### Q1: Implement a stack using an array
```ruby
stack = []
stack.push(1)
stack.push(2)
stack.pop # => 2
```
**Explanation:**
A stack is a LIFO (Last In, First Out) data structure. Using Ruby arrays, `push` adds an element to the top of the stack, and `pop` removes the top element.

**Learning Summary:**
- Understand the LIFO principle.
- Learn how to use Ruby arrays to implement stack operations.

#### Q2: Implement a queue using an array
```ruby
queue = []
queue.push(1)
queue.push(2)
queue.shift # => 1
```
**Explanation:**
A queue is a FIFO (First In, First Out) data structure. Using Ruby arrays, `push` adds an element to the end of the queue, and `shift` removes the first element.

**Learning Summary:**
- Understand the FIFO principle.
- Learn how to use Ruby arrays to implement queue operations.

---

### 4. Hash Tables (Maps)

#### Q1: Count character frequency in a string
```ruby
freq = Hash.new(0)
"hello".each_char { |c| freq[c] += 1 }
```

#### Q2: Find the first non-repeating character
```ruby
def first_non_repeating(str)
  freq = Hash.new(0)
  str.each_char { |c| freq[c] += 1 }
  str.each_char { |c| return c if freq[c] == 1 }
  nil
end
```

---

### 5. Recursion & Backtracking

#### Q1: Fibonacci using recursion
```ruby
def fib(n)
  return n if n <= 1
  fib(n-1) + fib(n-2)
end
```

#### Q2: Generate all subsets (backtracking)
```ruby
def subsets(arr, idx=0, curr=[], res=[])
  res << curr.dup
  (idx...arr.size).each do |i|
    curr << arr[i]
    subsets(arr, i+1, curr, res)
    curr.pop
  end
  res
end
```

---

### 6. Searching & Sorting

#### Q1: Binary Search
```ruby
def binary_search(arr, target)
  left, right = 0, arr.size - 1
  while left <= right
    mid = (left + right) / 2
    return mid if arr[mid] == target
    if arr[mid] < target
      left = mid + 1
    else
      right = mid - 1
    end
  end
  -1
end
```

#### Q2: Quick Sort
```ruby
def quick_sort(arr)
  return arr if arr.size <= 1
  pivot = arr[0]
  left = arr[1..].select { |x| x < pivot }
  right = arr[1..].select { |x| x >= pivot }
  quick_sort(left) + [pivot] + quick_sort(right)
end
```

---

### 7. Trees

#### Q1: Implement a binary tree node
```ruby
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end
```

#### Q2: Inorder traversal (recursive)
```ruby
def inorder(node)
  return [] unless node
  inorder(node.left) + [node.val] + inorder(node.right)
end
```

#### Q3: Level order traversal (BFS)
```ruby
def level_order(root)
  return [] unless root
  queue = [root]
  res = []
  while !queue.empty?
    node = queue.shift
    res << node.val
    queue << node.left if node.left
    queue << node.right if node.right
  end
  res
end
```

---

### 8. Graphs

#### Q1: Represent a graph using adjacency list
```ruby
graph = Hash.new { |h, k| h[k] = [] }
graph[1] << 2
graph[2] << 3
```

#### Q2: BFS traversal
```ruby
def bfs(graph, start)
  visited = {}
  queue = [start]
  res = []
  while !queue.empty?
    node = queue.shift
    next if visited[node]
    visited[node] = true
    res << node
    graph[node].each { |nbr| queue << nbr unless visited[nbr] }
  end
  res
end
```

#### Q3: DFS traversal
```ruby
def dfs(graph, node, visited = {}, res = [])
  return if visited[node]
  visited[node] = true
  res << node
  graph[node].each { |nbr| dfs(graph, nbr, visited, res) }
  res
end
```

---

### 9. Greedy Algorithms

#### Q1: Activity selection problem
```ruby
def activity_selection(activities)
  activities.sort_by! { |a| a[1] }
  res = [activities[0]]
  last_end = activities[0][1]
  activities[1..].each do |act|
    if act[0] >= last_end
      res << act
      last_end = act[1]
    end
  end
  res
end
```

---

### 10. Dynamic Programming

#### Q1: 0/1 Knapsack
```ruby
def knapsack(weights, values, W)
  n = weights.size
  dp = Array.new(n+1) { Array.new(W+1, 0) }
  (1..n).each do |i|
    (1..W).each do |w|
      if weights[i-1] <= w
        dp[i][w] = [dp[i-1][w], values[i-1] + dp[i-1][w-weights[i-1]]].max
      else
        dp[i][w] = dp[i-1][w]
      end
    end
  end
  dp[n][W]
end
```

#### Q2: Longest Increasing Subsequence
```ruby
def lis(arr)
  dp = [1] * arr.size
  (1...arr.size).each do |i|
    (0...i).each do |j|
      dp[i] = [dp[i], dp[j]+1].max if arr[i] > arr[j]
    end
  end
  dp.max
end
```

---

### 11. Advanced Topics

#### Q1: Segment Tree (Range Sum Query)
```ruby
class SegmentTree
  def initialize(arr)
    @n = arr.size
    @tree = Array.new(2*@n, 0)
    (0...@n).each { |i| @tree[@n+i] = arr[i] }
    (@n-1).downto(1) { |i| @tree[i] = @tree[2*i] + @tree[2*i+1] }
  end
  def sum(l, r)
    l += @n; r += @n
    res = 0
    while l < r
      res += @tree[l] if l.odd?
      res += @tree[r-1] if r.odd?
      l = (l+1)/2 if l.odd?
      r = (r-1)/2 if r.odd?
    end
    res
  end
end
```

#### Q2: Bit Manipulation - Count set bits
```ruby
def count_set_bits(n)
  count = 0
  while n > 0
    count += n & 1
    n >>= 1
  end
  count
end
```

---

### Resources
- [Ruby Official Docs](https://ruby-doc.org/)
- [LeetCode Ruby Solutions](https://leetcode.com/problemset/all/?language=Ruby)
- [GeeksforGeeks DSA](https://www.geeksforgeeks.org/data-structures/)
- [Big-O Cheat Sheet](https://www.bigocheatsheet.com/)

---

Happy Learning DSA with Ruby!

---

## Part 2: DSA Interview Roadmap for Product-Based Companies (Ruby)

This plan is tailored for cracking interviews at top product-based companies. It covers all core DSA topics, including matrices, patterns, and advanced algorithms, with Ruby code samples, key questions, and answers.

### Table of Contents
1. Arrays & Strings
2. Matrices
3. Linked Lists
4. Stacks & Queues
5. Hash Tables & Sets
6. Recursion & Backtracking
7. Searching & Sorting
8. Sliding Window & Two Pointers
9. Trees (Binary, BST, Heap, Trie)
10. Graphs (BFS, DFS, Shortest Path)
11. Greedy Algorithms
12. Dynamic Programming
13. Bit Manipulation
14. Advanced Topics (Segment Tree, Trie, Disjoint Set, Suffix Array)
15. System Design (Basics)
16. Patterns & Practice

---

### 1. Arrays & Strings
- Reverse, rotate, find duplicates, max subarray sum, two sum, move zeros, merge intervals, string anagrams, longest substring without repeating chars.

### 2. Matrices
- Spiral traversal, search in sorted matrix, rotate matrix, set matrix zeroes, island counting, path finding.

**Q: Spiral Order Traversal**
```ruby
def spiral_order(matrix)
  res = []
  return res if matrix.empty?
  top, bottom, left, right = 0, matrix.size-1, 0, matrix[0].size-1
  while top <= bottom && left <= right
    (left..right).each { |i| res << matrix[top][i] }
    top += 1
    (top..bottom).each { |i| res << matrix[i][right] }
    right -= 1
    if top <= bottom
      right.downto(left) { |i| res << matrix[bottom][i] }
      bottom -= 1
    end
    if left <= right
      bottom.downto(top) { |i| res << matrix[i][left] }
      left += 1
    end
  end
  res
end
```

**Q: Search a 2D Matrix**
```ruby
def search_matrix(matrix, target)
  return false if matrix.empty?
  m, n = matrix.size, matrix[0].size
  left, right = 0, m*n-1
  while left <= right
    mid = (left + right) / 2
    val = matrix[mid/n][mid%n]
    return true if val == target
    val < target ? left = mid + 1 : right = mid - 1
  end
  false
end
```

---

### 3. Linked Lists
- Reverse, detect cycle, merge two lists, intersection, palindrome, remove nth from end.

### 4. Stacks & Queues
- Min stack, valid parentheses, next greater element, implement queue with stacks.

### 5. Hash Tables & Sets
- Two sum, group anagrams, longest consecutive sequence, subarray sum equals k.

### 6. Recursion & Backtracking
- Permutations, combinations, N-Queens, Sudoku solver, word search.

### 7. Searching & Sorting
- Binary search, merge sort, quick sort, heap sort, top k elements.

### 8. Sliding Window & Two Pointers
- Longest substring with k distinct, min window substring, trapping rain water, container with most water.

**Q: Trapping Rain Water**
```ruby
def trap(height)
  left, right = 0, height.size-1
  left_max, right_max = 0, 0
  water = 0
  while left < right
    if height[left] < height[right]
      left_max = [left_max, height[left]].max
      water += left_max - height[left]
      left += 1
    else
      right_max = [right_max, height[right]].max
      water += right_max - height[right]
      right -= 1
    end
  end
  water
end
```

---

### 9. Trees
- Traversals, height, diameter, balanced, invert, lowest common ancestor, serialize/deserialize, BST validate, kth smallest/largest, Trie.

### 10. Graphs
- BFS, DFS, connected components, shortest path (Dijkstra, Floyd-Warshall), topological sort, cycle detection, MST (Kruskal, Prim), bipartite check.

### 11. Greedy Algorithms
- Activity selection, coin change, job sequencing, fractional knapsack, Huffman coding.

### 12. Dynamic Programming
- Fibonacci, climbing stairs, coin change, knapsack, LIS, LCS, edit distance, matrix chain multiplication, palindrome partitioning, DP on trees, DP on grids.

### 13. Bit Manipulation
- Count set bits, single number, power of two, subset generation, XOR swap, bitmask DP.

### 14. Advanced Topics
- Segment tree, Trie, Disjoint Set (Union-Find), Suffix Array/Tree, Fenwick Tree, KMP, Rabin-Karp, LRU cache.

### 15. System Design (Basics)
- Scalability, load balancer, caching, sharding, CAP theorem, consistency, availability, partition tolerance.

### 16. Patterns & Practice
- Sliding window, two pointers, fast & slow pointers, prefix sum, monotonic stack/queue, binary search on answer, backtracking, recursion tree.

---

### Resources
- [LeetCode Top Interview Questions](https://leetcode.com/problem-list/top-interview-questions/)
- [GeeksforGeeks DSA Sheet](https://www.geeksforgeeks.org/sde-sheet-by-striver/)
- [InterviewBit DSA](https://www.interviewbit.com/courses/programming/)
- [Big-O Cheat Sheet](https://www.bigocheatsheet.com/)
- [Ruby Docs](https://ruby-doc.org/)

---

**Tip:** Practice coding on paper/whiteboard, and time yourself. Focus on writing clean, bug-free Ruby code and explaining your approach.

---

Happy Interview Prep!
