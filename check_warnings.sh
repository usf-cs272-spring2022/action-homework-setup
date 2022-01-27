echo ""
echo "Checking Warnings..."

export JAVA_HOME="${JAVA_HOME}"

mvn -f pom.xml -ntp "-DcompileOptionXlint=-Xlint:all" "-DcompileOptionXdoclint=-Xdoclint:all/private" "-DcompileOptionFail=true" "-Dmaven.compiler.showWarnings=true" clean compile

if [[ $? -ne 0 ]];
then
  echo "::warning file=.github,line=1,col=1::Unable to compiling code without warnings. See the \"Check Warnings\" section in the run log for details."
  exit 1;
fi

exit 0;
