fn get_col_values(input: &[Vec<u64>], col: usize) -> Vec<u64> {
    let mut res: Vec<u64> = vec![];
    for row in input.iter() {
        for (col_ix, n) in row.iter().enumerate() {
            if col_ix == col {
                res.push(n.clone())
            }
        }
    }
    res
}

pub fn find_saddle_points(input: &[Vec<u64>]) -> Vec<(usize, usize)> {
    let mut res = vec![];

    for (row_ix, row) in input.iter().enumerate() {
        let max_in_row = row
            .iter()
            .max()
            .unwrap_or(&0);

        for (col_ix, m) in row.iter().enumerate() {
            if m >= max_in_row {

                let col_values = get_col_values(input, col_ix);

                let min_in_column = col_values
                    .iter()
                    .min()
                    .unwrap_or(&10_000);


                if m <= &min_in_column {
                    res.push((row_ix, col_ix))
                }
            }
        }
    }

    res
}
