class RFIDReader implements
AttachListener, DetachListener,
ErrorListener,
TagGainListener, TagLossListener {

  RFIDPhidget phidget;

  ArrayList listeners = new ArrayList();

  boolean init() {
    println(Phidget.getLibraryVersion());
    try {
      phidget = new RFIDPhidget();
      phidget.addAttachListener(this);
      phidget.addDetachListener(this);
      phidget.addErrorListener(this);
      phidget.addTagGainListener(this);
      phidget.addTagLossListener(this);
      phidget.openAny();
      println("waiting for RFID attachment...");
      phidget.waitForAttachment(1000);
      println("Serial: " + phidget.getSerialNumber());
      println("Outputs: " + phidget.getOutputCount());
      return true;
    } 
    catch(PhidgetException e) {
      println("couldn't initialize RFID phidget");
      return false;
    }
  }

  public void attached(AttachEvent e) {
    try {
      phidget.setAntennaOn(true);
      phidget.setLEDOn(true);
    }
    catch (PhidgetException ex) { 
    }
    for(Iterator i=listeners.iterator(); i.hasNext();) {
      ((RFIDEventAdapter)i.next()).attached(this);
    }
  }

  public void detached(DetachEvent e) {
    for(Iterator i=listeners.iterator(); i.hasNext();) {
      ((RFIDEventAdapter)i.next()).detached(this);
    }
  }

  public void error(ErrorEvent e) {
    for(Iterator i=listeners.iterator(); i.hasNext();) {
      ((RFIDEventAdapter)i.next()).error(this,e.toString());
    }
  }

  public void tagGained(TagGainEvent e) {
    println(listeners.size());
    for(Iterator i=listeners.iterator(); i.hasNext();) {
      ((RFIDEventAdapter)i.next()).tagRead(this,e.getValue());
    }
  }

  public void tagLost(TagLossEvent e) {
    for(Iterator i=listeners.iterator(); i.hasNext();) {
      ((RFIDEventAdapter)i.next()).tagLost(this,e.getValue());
    }
  }

  public void stop() {
    try {
      phidget.close();
    } 
    catch(PhidgetException e) {
    }
    phidget = null;
    println("RFIDReader shutdown");
  }

  public void addListener(RFIDEventAdapter l) {
    listeners.add(l);
  }

  public void removeListener(RFIDEventAdapter l) {
    listeners.remove(l);
  }
}

class RFIDEventAdapter {
  void attached(RFIDReader r) { 
  }
  void detached(RFIDReader r) { 
  }
  void error(RFIDReader r, String error) {
  }
  void tagRead(RFIDReader r, String tag) {
  }
  void tagLost(RFIDReader r, String tag) {
  }
}

