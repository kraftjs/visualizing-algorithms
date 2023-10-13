int[] a = new int[200];
int[] b;
int iteration = 0;

void setup() {
  size(1280, 720);
  background(255);
  for (int i=0; i < a.length; i++) {
    a[i] = i + 1;
  }
  Util.shuffle(a);
  b = a.clone();
}

void draw() {
  background(255);
  
  if (iteration < a.length) {
    selectionSortStep(a);
  }
  
  for (int i=0; i<a.length; i++) {
    if (i < iteration) {
      fill(128, 255, 0);
    }
    
    rect(  
      i * width / a.length,
      height / 2,
      width / a.length,
      -1 * a[i] * height / a.length / 2
    );
    
    rect(  
      i * width / b.length,
      height / 2,
      width / b.length,
      b[i] * height / b.length / 2
    );
    
    noFill();
  }
}

void selectionSortStep(int[] array) {
  int index = iteration;
  for (int j=iteration; j<array.length; j++) {
    if (array[j] < array[index]) {
      index = j;
    }
  }
  Util.swap(array, iteration, index);
  iteration++;
}

void quickSortStep(int[] array) {
  // todo: implement
}
