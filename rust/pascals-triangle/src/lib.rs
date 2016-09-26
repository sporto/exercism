pub struct PascalsTriangle {
	count: usize,
}

fn make_row(previousRow: &[u32]) -> Vec<u32> {
	if previousRow.len() == 0 {
		vec![1]
	} else {
		let mut result = vec![];

		for (i, &item) in previousRow.iter().enumerate() {
			let prev = if i == 0 {
				0
			} else {
				previousRow[i - 1]
			};

			result.push(item + prev)
		}

		result.push(1);
		result
	}
}

fn fill(acc: Vec<Vec<u32>>, prev: &[u32], to_go: usize)  -> Vec<Vec<u32>> {
	match to_go {
		0 =>
			acc,
		_ => {
			let new_row = make_row(&prev);
			let mut acc2 = acc.clone();
			acc2.push(new_row.clone());
			fill(acc2, &new_row, to_go - 1)
		}
	}
}

impl PascalsTriangle {
	pub fn new(row_count: u32) -> Self {
		PascalsTriangle { count: row_count as usize }
	}

	pub fn rows(&self) -> Vec<Vec<u32>> {
		let acc = Vec::new();
		fill(acc, &vec![], self.count)
	}
}
