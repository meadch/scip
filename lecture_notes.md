- [x] [Lecture 13](https://archive.org/details/ucberkeley_webcast_kbqJ3UGPgOc)

* `deep-map` on different tree structures
* Two recursive calls performed => *tree recursion*
  * `count-change` as an *implicit* tree-like control structure (23:00)

**Tree traversal**

Given a tree like this:

![Tree](./assets/tree.png)

Print out the datum on every line. There are two ways.

**Depth first**

```scm
(define (depth-first-search tree)
  (display (datum tree))
  (for-each depth-first-search (children tree)))
```

**Breadth first**

> Requires auxilary `queue` structure

```scm
(define (breadth-first-search tree)
  (bfs-iter (list tree)))

(define (bfs-iter queue)
  (if (null? queue)
      'done
      (let ((task (car queue)))
        (display (datum task))
        (bfs-iter (append (cdr queue) (children task))))))
```

---
- [x] [Lecture 31: Concurrency I](https://archive.org/details/ucberkeley_webcast_tfTD0B8dX7I)

```scm
(set! x (+ x 1))
```

In machine language:

1. Load register $8, x (Take `x` out of big, slow memory and move it into processor register)
2. ADDI (add immediate) $8, 1
3. Store $8, x

There's a problem if we have parralelism, two threads doing things at the same time, because each processor has its own registers to load values into.

How to designate a series of instructions (a **critical section**) as unable to be interrupted?

> `make-serializer`

A serializer takes a procedure and returns a protected procedure.

**Levels of abstraction:**

| Element       | Notes         | 
| ------------- |:-------------:| 
| protected procedure/object  | programming language |
| `make-serializer`   | ... | 
| critical sections | (provided by OS, delimit critical section with beginning and ending) |
| `make-mutex` (mutual exclusion) | ... |
| Atomic Test and Set | (provided by hardware) |

You must have some type of hardware support at the lowest level.

**How can things go bad?**

* Incorrect results
* Ineffiency (fail to do in parellel what could be done in parellel)
* Deadlock
* Unfairness

---
- [ ] [Lecture 32: Concurrency II](https://archive.org/details/ucberkeley_webcast_a_qhlzmXqAo)