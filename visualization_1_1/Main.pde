int[] array = new int[200];

void setup() {
  size(1280, 720);
  background(255, 255, 255);
  for (int i=0; i < array.length; i++) {
    array[i] = i + 1;
  }
  Util.shuffle(array);
}

void draw() {
  for (int i=0; i<array.length; i++) {
    int element = array[i];
     rect(
       i * width / array.length,
       height - element * height / array.length,
       width / array.length,
       element * height / array.length
     ); 
  }
}
