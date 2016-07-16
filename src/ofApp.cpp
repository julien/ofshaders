#include "ofApp.h"


ofShader shader;

void ofApp::setup() {
    shader.load("", "blobs.glsl");
}

void ofApp::update() {

}

void ofApp::draw() {
    shader.begin();
    shader.setUniform2f("u_resolution", ofGetWidth(), ofGetHeight());
    shader.setUniform1f("u_time", ofGetElapsedTimef());
    ofDrawRectangle(0, 0, ofGetWidth(), ofGetHeight());
    shader.end();
}
