// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Separation
// Via Reynolds: http://www.red3d.com/cwr/steer/

// A list of vehicles
ArrayList<Vehicle> vehicles;

void setup() {
  size(640, 360);
  
  vehicles = new ArrayList<Vehicle>();
  
  // We are now making random vehicles and storing them in an array
  for (int i = 0; i < 25; i++) {
    vehicles.add(new Vehicle(random(width), random(height)));
  }
}

void draw() {
  background(255);


  for (Vehicle v : vehicles) {
    v.separate(vehicles);
    v.update();
    v.borders();
    v.show();
  }

}


void mouseDragged() {
  vehicles.add(new Vehicle(mouseX, mouseY));
}
