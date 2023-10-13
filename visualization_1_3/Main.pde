import java.util.Stack;
int[] array = new int[300];

int[] selectionSortArray;
int iteration = 0;
int numberOfComparisonsSelectionSort = 0;

int[] quickSortArray;
int leftBound, rightBound;
Stack<Range> stack = new Stack<>();
int numberOfComparisonsQuickSort = 0;

void setup() {
  size(1280, 720);
  background(255);
  for (int i=0; i < array.length; i++) {
    array[i] = i + 1;
  }
  Util.shuffle(array);
  selectionSortArray = array.clone();
  quickSortArray = array.clone();
  stack.push(new Range(0, quickSortArray.length-1));
}

void draw() {
  background(255);
  frameRate(map(mouseX, 0, width, 5, 60));

  if (iteration < selectionSortArray.length) {
    selectionSortStep(selectionSortArray);
  }
  
  if (!stack.empty()) {
    quickSortStep(quickSortArray);
  }
  
  drawSelectionSort(selectionSortArray);
  drawQuickSort(quickSortArray);
}

void drawSelectionSort(int[] nums) {
  for (int i=0; i<nums.length; i++) {
    if (i < iteration) {
      fill(128, 255, 0);
    } else if (i == iteration) {
      fill(255, nums[i]/3, 255);
    } else {
      noFill();
    }
    rect(
      i * width / nums.length,
      height / 2,
      width / nums.length,
      -1 * nums[i] * height / nums.length / 2
      );
  }
  fill(0);
  textSize(20);
  text("Selection Sort", 10, 20);
  textSize(14);
  text("Comparisons: " + numberOfComparisonsSelectionSort, 10, 35);
}

void selectionSortStep(int[] nums) {
  int index = iteration;
  for (int j=iteration; j<nums.length; j++) {
    if (nums[j] < nums[index]) {
      index = j;
    }
    numberOfComparisonsSelectionSort++;
  }
  Util.swap(nums, iteration++, index);
}

void drawQuickSort(int[] nums) {
  for (int i=0; i<nums.length; i++) {
    if (i < leftBound || stack.empty()) {
      fill(128, 255, 0);
    } else if (i >= leftBound && i <= rightBound) {
      fill(255, nums[i]/3, 255);
    } else {
      noFill();
    }
    rect(
      i * width / nums.length,
      height / 2,
      width / nums.length,
      nums[i] * height / nums.length / 2
      );
  }
  fill(0);
  textSize(20);
  text("Quicksort", 10, height - 25);
  textSize(14);
  text("Comparisons: " + numberOfComparisonsQuickSort, 10, height - 10);
}

void quickSortStep(int[] nums) {
  Range range = stack.pop();
  int left = range.left;
  int right = range.right;
  leftBound = left;
  rightBound = right;
  
  if (left < right) {
    int pivot = partition(nums, left, right);
    stack.push(new Range(pivot+1, right));
    stack.push(new Range(left, pivot-1));
  }
}

int partition(int[] nums, int left, int right) {
  int pivot = right;
  int i = left;
  int j = right - 1;
  while (i <= j) {
    if (nums[i] < nums[pivot]) {
      i++;
    } else if (nums[j] >= nums[pivot]) {
      j--;
    } else {
      Util.swap(nums, i++, j--);
    }
    numberOfComparisonsQuickSort++;
  }
  Util.swap(nums, i, pivot);
  return i;
}
