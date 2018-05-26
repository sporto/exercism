pub struct SimpleLinkedList<T> {
    head: Option<Box<Node<T>>>,
}

struct Iter<T> {
    current: Option<Box<Node<T>>>,
}

pub struct Node<T> {
    data: T,
    next: Option<Box<Node<T>>>,
}

impl<T> SimpleLinkedList<T> {
    pub fn new() -> Self {
        SimpleLinkedList { head: None }
    }

    pub fn len(&self) -> usize {
        match self.head {
            None => 0,
            Some(ref n) => n.len(),
        }
    }

    pub fn push(&mut self, element: T) {
        let head = self.head.take();

        let node = Some(Box::new(Node {
            data: element,
            next: head,
        }));

        self.head = node;
    }

    pub fn pop(&mut self) -> Option<T> {
        let head = self.head.take();

        match head {
            None => None,
            Some(mut node) => {
                self.head = node.next.take();
                Some(node.data)
            }
        }
    }

    pub fn peek(&self) -> Option<&T> {
        match self.head {
            None => None,
            Some(ref node) => Some(&node.data),
        }
    }

    pub fn iter(&self) -> Iter<T> {
        Iter { current: self.head }
    }
}

impl<T> Node<T> {
    pub fn len(&self) -> usize {
        match self.next {
            None => 1,
            Some(ref n) => 1 + n.len(),
        }
    }
}

impl<T: Clone> SimpleLinkedList<T> {
    pub fn rev(&self) -> SimpleLinkedList<T> {
        let mut list = Self::new();

        // self.iter()
        // self.into()
        //     .iter()
        //     .map(|n| list.push(n) )

        list
    }
}

impl<'a, T: Clone> From<&'a [T]> for SimpleLinkedList<T> {
    fn from(item: &[T]) -> Self {
        let mut list = Self::new();
        for i in item.iter().cloned() {
            list.push(i)
        }
        list
    }
}

impl<T> Into<Vec<T>> for SimpleLinkedList<T> {
    fn into(mut self) -> Vec<T> {
        let mut vec = Vec::new();
        while let Some(n) = self.pop() {
            vec.push(n);
        }
        vec.reverse();
        vec
    }
}

impl<'a, T> Iterator for Iter<'a, T> {
    type Item = &'a T;

    fn next(&mut self) -> Option<&'a T> {
        let result = self.current;
        self.current = result.next;
        result
    }
}
