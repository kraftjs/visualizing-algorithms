int[] array = new int[25];
int iteration = 0;
int subIteration = 0;
int index = 0;

void setup() {
  size(1280, 720);
  background(255);
  for (int i=0; i < array.length; i++) {
    array[i] = i + 1;
  }
  Util.shuffle(array);
}

void draw() {
  background(255);
  
  if (array[subIteration] < array[index]) {
    index = subIteration;
  }
  
  for (int i=0; i<array.length; i++) {
    if (i < iteration) {
      fill(128, 255, 0);
    }
    if (i == subIteration) {
      fill(0);
    }
    if (i == index) {
      fill(255, 255, 0);
    }
    rect(  
      i * width / array.length,
      height - array[i] * height / array.length,
      width / array.length,
      array[i] * height / array.length
    );
    noFill();
  }
  
  if (subIteration == array.length - 1 && iteration != array.length) {
    Util.swap(array, iteration, index);
    subIteration = ++iteration;
    index = subIteration;
  } else {
    subIteration++;
  }
}

void selectionSort(int[] array) {
  for (int i=0; i<array.length; i++) {
    int index = i;
    for (int j=i+1; j<array.length; j++) {
      if (array[j] < array[index]) {
        index = j;
      }
    }
    Util.swap(array, i, index);
  }
}
