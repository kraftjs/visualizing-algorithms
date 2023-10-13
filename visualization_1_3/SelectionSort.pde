public static class SelectionSort {
  public static int[] sortArray(int[] nums) {
    for (int i=0; i<nums.length; i++) {
      int index = i;
      for (int j=i+1; j<nums.length; j++) {
        if (nums[j] < nums[index]) {
          index = j;
        }
      }
      Util.swap(nums, i, index);
    }
    return nums;
  }
}
