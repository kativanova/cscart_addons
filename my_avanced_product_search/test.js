let arr = [8, 6, 3, 1, 5, 3, 10];
let sorted;
do {
  sorted = true;
  for (let i = 1; i < arr.length; i += 1) {
    if (arr[i] < arr[i - 1]) {
      let tmp = arr[i - 1];
      arr[i - 1] = arr[i];
      arr[i] = tmp;
      sorted = false;
    }
  }
} while (!sorted);


console.log(arr);
