# docker-ionic-capacitor

An images that allow to build apk with Ionic 6 and Capacitor.

Notice that it accept Android SDK licence, so before use it be sure to consult them.

Example of a .gitlab_ci.yaml that build debug apk (not signed) : 

```
# Gitlab CI - Build Ionic 6 Project and generates apk files
image: jusabatier/docker-ionic-capacitor:latest

stages:
  - deploy

cache:
  untracked: true
  key: "$CI_PROJECT_ID"
  paths:
    - node_modules/

build_android:
  stage: deploy
  only:
    - master
  script:
    - ls
    - npm i
    - ionic capacitor build android --no-open
    - |
        # build Android
        cd android
        ./gradlew assembleDebug                
  artifacts:
    paths:
      - android/app/build/outputs/apk/debug/*.apk
```
