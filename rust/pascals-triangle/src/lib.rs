pub struct PascalsTriangle {
	_rows: &mut Vec<Vec<u32>>,
}

fn make_row(previousRow: Vec<u32>) -> Vec<u32> {
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

fn fill(acc: &mut Vec<Vec<u32>>, prev: Vec<u32>, to_go: u32)  -> &mut Vec<Vec<u32>> {
	match to_go {
		0 =>
			acc,
		_ => {
			let new_row = make_row(prev);
			acc.push(new_row);
			fill(acc, new_row, to_go - 1)
		}
	}
}

impl PascalsTriangle {
	pub fn new(row_count: u32) -> Self {
		let mut acc = vec![];
		let res = fill(acc, vec![], row_count);

		PascalsTriangle { _rows: res }
	}

	pub fn rows(&self) -> Vec<Vec<u32>> {
		self._rows
	}
}
