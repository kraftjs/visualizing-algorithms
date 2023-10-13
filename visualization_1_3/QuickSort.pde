public static class QuickSort {
  public static int[] sortArray(int[] nums) {
    quickSort(nums, 0, nums.length - 1);
    return nums;
  }
  
  private static void quickSort(int[] nums, int left, int right) {
    if (left >= right) {
      return;
    }
    int p = partition(nums, left, right);
    quickSort(nums, left, p-1);
    quickSort(nums, p+1, right);
  }
  
  private static int partition(int[] nums, int left, int right) {
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
    }
    Util.swap(nums, i, pivot);
    return i;
  }
}
