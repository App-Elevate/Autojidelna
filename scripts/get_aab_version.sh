curl -L -o bundletool-all.jar https://github.com/google/bundletool/releases/download/1.17.0/bundletool-all-1.17.0.jar
java -jar bundletool-all.jar dump manifest --bundle=app-release.aab --output=output.xml
rm bundletool-all.jar