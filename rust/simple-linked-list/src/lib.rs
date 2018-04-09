pub struct SimpleLinkedList<T> {
    head: Option<Box<Node<T>>>,
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
        unimplemented!()
    }
}

impl<'a, T: Clone> From<&'a [T]> for SimpleLinkedList<T> {
    fn from(item: &[T]) -> Self {
        unimplemented!()
    }
}

impl<T> Into<Vec<T>> for SimpleLinkedList<T> {
    fn into(mut self) -> Vec<T> {
        unimplemented!()
    }
}
