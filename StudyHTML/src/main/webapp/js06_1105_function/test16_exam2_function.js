
function printArray(arr) {
		for (let i = 0; i < arr.length; i++) {
			document.write(arr[i] + " "); // 한줄에 나오기 위해서		
		}
		document.write("<br>");
}
function rotation(arr) {
	let temp = arr[0];

	for (let i = 0; i < arr.length - 1; i++) {
		arr[i] = arr[i + 1]
	}
	arr[arr.length - 1] = temp;
}