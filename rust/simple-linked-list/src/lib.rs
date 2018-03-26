pub struct SimpleLinkedList<T> {
    node: Option<Node<T>>,
}

pub struct Node<T> {
    data: T,
    next: Option<Box<Node<T>>>,
}

impl<T> SimpleLinkedList<T> {
    pub fn new() -> Self {
        SimpleLinkedList { node: None }
    }

    pub fn len(&self) -> usize {
        match self.node {
            None => 0,
            Some(ref n) => n.len(),
        }
    }

    pub fn push(&mut self, element: T) {
        unimplemented!()
    }

    pub fn pop(&mut self) -> Option<T> {
        unimplemented!()
    }

    pub fn peek(&self) -> Option<&T> {
        unimplemented!()
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
