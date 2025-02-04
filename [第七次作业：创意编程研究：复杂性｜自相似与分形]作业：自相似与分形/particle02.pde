class Particle {
    PVector loc;
    float rr;
    PVector acc = new PVector(0, 0);
    PVector speed = new PVector(0, 0);
    float minDist;

    Particle(PVector loc_, float rr_) {
        loc = loc_;
        rr = rr_;
        minDist = 3*rr_;
    }
    
    void run(){
        showBall();
        // showSpeedArrow();
        move();
        crossCanvas();
        // connect();
        force_between_particles();
        mouseAttraction();
        scaredBymouseclick();
    }
    void showSpeedArrow(){
        //heading()  get the angle of vector
        stroke(255, 0, 255);
        line(loc.x, loc.y, loc.x + rr*2*cos(speed.heading()), loc.y + rr*2*sin(speed.heading()));
    }
    //----------------------------------------------------
    void fractal(float rr_, PVector loc_){
        ellipse(loc_.x, loc_.y, rr_, rr_);
        float new_rr = rr_*0.6;
        if(new_rr>20){
            pushMatrix();
            translate((rr_/2+new_rr/2)*cos(radians(frameCount)),(rr_/2+new_rr/2)*sin(radians(frameCount)));
            fractal(new_rr,loc_);
            popMatrix();

            pushMatrix();
            translate((rr_/2+new_rr/2)*cos(radians(frameCount)+radians(120)),(rr_/2+new_rr/2)*sin(radians(frameCount)+radians(120)));
            fractal(new_rr,loc_);
            popMatrix();

            pushMatrix();
            translate((rr_/2+new_rr/2)*cos(radians(frameCount)+radians(240)),(rr_/2+new_rr/2)*sin(radians(frameCount)+radians(240)));
            fractal(new_rr,loc_);
            popMatrix();
        }
    }
    void showBall() {
        fill(255);
        noStroke();
        fractal(rr,loc);//增加粒子周位分形的图案
    }
    //----------------------------------------------------
    void move() {//update the speed and acc
        speed.add(acc);
        //Limit the speed, otherwise it will get faster and faster
        speed.limit(2);
        loc.add(speed);
        acc = new PVector(0, 0);//每一帧的加速度单独作用
    }
    void connect(){//connect with line
        for (Particle p : particles) {
            PVector attr = PVector.sub(loc, p.loc);
            float dist = attr.mag();
            if(dist > minDist*7 && dist <minDist*8){
                stroke(255, 255, 0);
                strokeWeight(1);
                line(loc.x, loc.y, p.loc.x, p.loc.y);
            }
        }
    }
    void crossCanvas(){//穿过边界到另一端
        if(loc.x > width-rr) loc.x = rr;
        if(loc.x < rr) loc.x = width-rr;
        if(loc.y > height-rr) loc.y = rr;
        if(loc.y < rr) loc.y = height-rr;
    }
    void force_between_particles(){
        for (Particle p : particles) {
            PVector attr = PVector.sub(loc, p.loc);
            float dist = attr.mag();
            if(dist > 0 && dist < minDist){
                attr.normalize();
                attr.mult(100/dist);
                acc.add(attr);
            }else if(dist >= minDist){
                attr.normalize();
                attr.mult(-1/dist);
                acc.add(attr);
            }
        }
    }
    void mouseAttraction(){//attracted by mouse
        PVector m = new PVector(mouseX, mouseY);
        float d = PVector.dist(m, loc);
        PVector attr = PVector.sub(m, loc);//loc to m
        attr.normalize();
        attr.mult(200/d);
        acc.add(attr);
    }
    //---------------------------------
    //mouse event, particles are scared by mouse click
    void scaredBymouseclick(){
        if(mousePressed){
            PVector m = new PVector(mouseX, mouseY);
            float d = PVector.dist(m, loc);
            PVector attr = PVector.sub(loc, m);//m to loc
            attr.normalize();
            attr.mult(200);
            acc.add(attr);
        }
    }
}
