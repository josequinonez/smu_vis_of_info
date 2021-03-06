
Grid grid;
Axes axes;
float camRot;
float camRotSpeed;
private static final int ROT_X = 0;
private static final int ROT_Y = 1;
private static final int ROT_Z = 2;

int rotationAxis;

LightSource myLight;

ArrayList<AbstractGeometry> objects;

void settings()
{
  size(600, 600, P3D);
}

void setup()
{
  camRotSpeed = 0.005;
  rotationAxis = ROT_Y;
  
  grid = new Grid(this, 20, 20);
  axes = new Axes(this);
  myLight = new LightSource(this, color(200,200,200), new PVector(200, -200, 200), LightSource.DIRECTIONAL);
  
  objects = new ArrayList<AbstractGeometry>();
  
  Cylinder c = new Cylinder(this, 200, 200, 10, 200);
  c.setTexture("testing.png");
  c.init();
  
  objects.add(c);
}

void draw()
{
  background(0);
    
  camRot += camRotSpeed;
  beginCamera();
    camera(300, -300, 300, 0, 0, 0, 0, 1, 0);
    switch(rotationAxis)
    {
      case ROT_X :
        rotateX(camRot);
      break;
      case ROT_Y :
        rotateY(camRot);
      break;
      case ROT_Z :
        rotateZ(camRot);
      break;
    }
  endCamera();

  lights();
  //grid.render();
  axes.render();
  
  for(int i = 0; i < objects.size(); i++)
  {
    objects.get(i).render();
  }
}

void keyPressed()
{
  if(key == 'x')
  {
    rotationAxis = ROT_X;
  }
  else if(key == 'y')
  {
    rotationAxis = ROT_Y;
  }
  else if(key == 'z')
  {
    rotationAxis = ROT_Z;
  }
  else if(key == ' ')
  {
    camRotSpeed = camRotSpeed != 0 ? 0 : 0.005; 
  }
}