int[] array = new int[200];
int iteration = 0;

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
  
  if (iteration < array.length) {
    selectionSortStep();
  }
  
  for (int i=0; i<array.length; i++) {
    if (i < iteration) {
      fill(128, 255, 0);
    }
    
    rect(  
      i * width / array.length,
      height - array[i] * height / array.length,
      width / array.length,
      array[i] * height / array.length
    );
    
    noFill();
  }
}

void selectionSortStep() {
  int index = iteration;
  for (int j=iteration; j<array.length; j++) {
    if (array[j] < array[index]) {
      index = j;
    }
  }
  Util.swap(array, iteration, index);
  iteration++;
}
